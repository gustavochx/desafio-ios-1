//
//  APIClient.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 12/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

public enum APIError: Error {

    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    case unauthorized

    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        case .unauthorized: return "Unauthorized"
        }
    }
}


public protocol APIClient {

    var session: URLSession { get }
    func fetch <T:Decodable>
        (with request: URLRequest,decode: @escaping(Decodable) -> T? , completionHandler: @escaping(Result<T, APIError>) -> Void)
}

public extension APIClient {

    typealias JSONTaskCompletionHandler = (Decodable?, APIError?) -> Void
    typealias JSONEmptyCompletionHandler = (APIError?) -> Void

    public func decodingTask <T:Decodable>
        (with request: URLRequest,decodingType : T.Type, completionHandler completion: @escaping JSONTaskCompletionHandler ) -> URLSessionDataTask {

        let task = session.dataTask(with: request) { data, response, _ in

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }

            if httpResponse.statusCode == 200 || httpResponse.statusCode == 201 {
                if let data = data {
                    do{
                        let genericModel = try JSONDecoder().decode(decodingType, from: data)
                        completion(genericModel,nil)
                    } catch {
                        completion(nil, .jsonParsingFailure)
                    }

                } else {
                    completion(nil, .invalidData)
                }

            } else {
                completion(nil, .responseUnsuccessful)
            }
        }
        return task
    }

    public func taskWithoutDecode(with request: URLRequest, completionHandler completion: @escaping JSONEmptyCompletionHandler ) -> URLSessionDataTask {

        let task = session.dataTask(with: request) { _, response, _ in

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.requestFailed)
                return
            }

            if httpResponse.statusCode == 200 {
                completion(nil)
            } else if httpResponse.statusCode == 401 {
                completion(.unauthorized)
            } else {
                completion(.responseUnsuccessful)
            }
        }

        return task
    }

    public func taskImageUrl(with request: URLRequest, completionHandler: @escaping(_ data: Data?, _ error: APIError?) -> Void) -> URLSessionDataTask {

        let task = session.dataTask(with: request) { data, response, _ in

            guard let httpResponse = response as? HTTPURLResponse else {
                completionHandler(nil, .requestFailed)
                return
            }

            if httpResponse.statusCode == 200 {
                completionHandler(data,nil)
            } else if httpResponse.statusCode == 401 {
                completionHandler(nil,.unauthorized)
            } else {
                completionHandler(nil,.responseUnsuccessful)
            }
        }

        return task

    }

    public func fetchImage(by url: URL, completionHandler: @escaping(_ image: UIImage?, _ apiError: APIError?) -> Void ) {

        var imageRequest = URLRequest(url: url)
        imageRequest.httpMethod = "GET"

        let task = taskImageUrl(with: imageRequest) { (data, error) in

            DispatchQueue.main.async {
                if error != nil {
                    completionHandler(nil, error)
                }
                completionHandler(UIImage(data: data!),nil)
            }
        }

        task.resume()

    }


    public func fetch<T:Decodable>(with request: URLRequest, decode: @escaping(Decodable) -> T?, completionHandler: @escaping(Result<T, APIError>) -> Void) {

        let task = decodingTask(with: request, decodingType: T.self) { json, error in

            DispatchQueue.main.async {
                guard let json = json else {
                    if let error = error {
                        completionHandler(Result.failed(error))
                    } else {
                        completionHandler(Result.failed(.invalidData))
                    }
                    return
                }

                if let data = decode(json) {
                    completionHandler(Result.success(data))
                } else {
                    completionHandler(Result.failed(.jsonParsingFailure))
                }
            }
        }
        task.resume()
    }
}

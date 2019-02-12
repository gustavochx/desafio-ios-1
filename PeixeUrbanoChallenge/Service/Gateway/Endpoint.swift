//
//  Endpoint.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 12/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

public protocol Endpoint {
    var baseUrl : String { get }
    var path : String { get }
}

public extension Endpoint {


    var urlComponentes : URLComponents {
        var components = URLComponents(string: baseUrl)!
        components.path = path
        return components
    }

    var requestGet : URLRequest {
        var urlRequest = URLRequest(url: urlComponentes.url!)
        urlRequest.httpMethod = "GET"
        return urlRequest
    }

    var requestPost : URLRequest {
        var urlRequest = URLRequest(url: urlComponentes.url!)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return urlRequest
    }

    var requestDelete : URLRequest {
        var urlRequest = URLRequest(url: urlComponentes.url!)
        urlRequest.httpMethod = "DELETE"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return urlRequest
    }

    var requestPut : URLRequest {
        var urlRequest = URLRequest(url: urlComponentes.url!)
        urlRequest.httpMethod = "PUT"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return urlRequest
    }

    var requestPatch : URLRequest {
        var urlRequest = URLRequest(url: urlComponentes.url!)
        urlRequest.httpMethod = "PATCH"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return urlRequest
    }


    func changeRequestForUsingId(for id: String, and method: String) -> URLRequest {

        var mutatingComponents = URLComponents(string: baseUrl)!
        mutatingComponents.path = path + "\(id)"

        var urlRequest = URLRequest(url: mutatingComponents.url!)
        urlRequest.httpMethod = method
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return urlRequest
    }



}

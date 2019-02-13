//
//  PeixeUrbanoClient.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 12/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

class PeixeUrbanoClient: APIClient {
    public let session: URLSession
    let offerClient: OfferImageClient

    public init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
        self.offerClient = OfferImageClient(configuration: configuration)
    }

    public convenience init() {
        self.init(configuration: .default)
    }

    func getCityDeals(completion: @escaping(Result<OfferResponse,APIError>) -> Void) {
        getCity(with: .listcityoffers) { [weak self] result in
            switch(result) {
            case .sucess(let offerResponse):
                completion(Result.sucess(offerResponse))

            case .failed(let error):
                completion(Result.failed(error))
            }
        }


    }

    private func getCity(with cityRequest: PeixeUrbanoEndpoints,
                              completion: @escaping(Result<OfferResponse,APIError>) -> Void) {

        let endpoint = cityRequest
        let request = endpoint.requestGet

        fetch(with: request, decode: { (json) -> OfferResponse? in
            guard let object = json as? OfferResponse else {
                return nil
            }
            return object
        }, completionHandler: completion)
    }

    /*
    func login(_ loginInfo: LoginRequest, completion: @escaping(Result<UserProfile,APIError>) -> Void) {

        login(with: .login, and: MockAPILoginRequest(loginInfo.username, loginInfo.password)) { [weak self] result in
            switch(result) {

            case .sucess(let loginResponse):

                if let loginResponse = loginResponse {
                    let url = URL(string: loginResponse.avatar)!

                    self?.imageClient.downloadImage(url: url) { profileImage, profileError in

                        if let _ = profileError {
                            completion(Result.failed(APIError.requestFailed))
                        } else if let profileImage = profileImage {
                            let profile = UserProfile(loginResponse.name, profileImage)
                            completion(Result.sucess(profile))
                        }
                    }
                }

            case .failed(let error):
                completion(Result.failed(error))
            }
        }
    }


    private func login(with userRequest: MockEndpoints, and user: MockAPILoginRequest, completion: @escaping(Result<MockAPILoginResponse?,APIError>) -> Void) {

        let endpoint = userRequest
        var request = endpoint.requestPost

        request.httpBody = user.jsonEncode()

        fetch(with: request, decode: { (json) -> MockAPILoginResponse? in
            guard let userResult = json as? MockAPILoginResponse else {
                return nil
            }
            return userResult
        }, completionHandler: completion)

    }*/
    

}

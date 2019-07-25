//
//  PeixeUrbanoClient.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 12/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

class PeixeUrbanoClient: APIClient {

    public static let shared = PeixeUrbanoClient()
    public let session: URLSession

    public init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    public convenience init() {
        self.init(configuration: .default)
    }

    func getCityDeals(city: String?, completion: @escaping(Result<OfferResponse,APIError>) -> Void) {

        if city == nil {

            getCity {  result in
                switch(result) {
                case .success(let offerResponse):
                    completion(Result.success(offerResponse))

                case .failed(let error):
                    completion(Result.failed(error))
                }
            }

        } else {

            getDealsFor(city: city!) { result in
                switch(result) {
                case .success(let offerResponse):
                    completion(Result.success(offerResponse))

                case .failed(let error):
                    completion(Result.failed(error))
                }
            }
        }
    }

    private func getCity(completion: @escaping(Result<OfferResponse,APIError>) -> Void) {
        let request = PeixeUrbanoEndpoints.listcityoffers.requestGet

        fetch(with: request, decode: { (json) -> OfferResponse? in
            guard let object = json as? OfferResponse else {
                return nil
            }
            return object
        }, completionHandler: completion)

    }

    private func getDealsFor(city: String, completion: @escaping(Result<OfferResponse,APIError>)->Void) {

        var request = PeixeUrbanoEndpoints.listcityoffers.requestGet
        request.url = URL(string: "https://gist.githubusercontent.com/insidegui/2b1f747ebeb9070e33818bf857e28a84/raw/5da63767fda2ec16f4ae0718e3be4be75001fe10/\(city).json")

        fetch(with: request, decode: { (json) -> OfferResponse? in
            guard let object = json as? OfferResponse else {
                return nil
            }
            return object
        }, completionHandler: completion)

    }

    func getTripOffers(completion: @escaping(Result<OfferResponse,APIError>) -> Void) {
        getTrip { result in
            switch (result) {
            case .success(let offerResponse):
                completion(Result.success(offerResponse))
            case .failed(let error):
                completion(Result.failed(error))
            }
        }
    }

    private func getTrip(completion: @escaping(Result<OfferResponse,APIError>) -> Void) {

        let request = PeixeUrbanoEndpoints.listtripoffers.requestGet

        fetch(with: request, decode: { (json) -> OfferResponse? in
            guard let object = json as? OfferResponse else {
                return nil
            }
            return object
        }, completionHandler: completion)
    }

    func getProductsOfferr(completion: @escaping(Result<OfferResponse,APIError>) -> Void) {
        getProducts { result in
            switch (result) {
            case .success(let productsOffer):
                completion(Result.success(productsOffer))
            case .failed(let error):
                completion(Result.failed(error))
            }
        }
    }

    private func getProducts(completion: @escaping(Result<OfferResponse,APIError>) -> Void) {

        let request = PeixeUrbanoEndpoints.listproductoffers.requestGet
        fetch(with: request, decode: { (json) -> OfferResponse? in
            guard let responseJson = json as? OfferResponse else {
                return nil
            }
            return responseJson
        }, completionHandler: completion)
    }
}

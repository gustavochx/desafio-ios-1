//
//  ListProductOfferInteractor.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 24/05/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

protocol ListProductOfferInteractorDelegate {
    func didFetchOffers(_ offers: [Offer])
    func errorOnFetch(_ error: APIError)
}

class ListProductOfferInteractor {
    var delegate: ListProductOfferInteractorDelegate?

    func getProducts() {
        getProductOffers { (result) in
            switch(result) {
                case .success(let deals):
                    self.delegate?.didFetchOffers(deals)
                case .failed(let error):
                    self.delegate?.errorOnFetch(error)
            }
        }
    }

    private func getProductOffers(completion: @escaping(Result<[Offer],APIError>)->Void) {
        PeixeUrbanoClient.shared.getProductsOfferr { (result) in
            switch(result) {
            case .success(let offerResponse):
                guard let deals = offerResponse.response.deals else {
                    return
                }
                completion(Result.success(deals))
            case .failed(let error):
                completion(Result.failed(error))
            }
        }

    }
}

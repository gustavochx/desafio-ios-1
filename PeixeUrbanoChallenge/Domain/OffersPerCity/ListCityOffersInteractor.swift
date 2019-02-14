//
//  ListCityInteractor.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 13/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

protocol ListCityOffersInteractorDelegate {
    func fetchOffers(_ offers: [Offer])
    func errorOnFetchOffers(_ error: Error)
}

class ListCityOffersInteractor {
    var delegate: ListCityOffersInteractorDelegate?

    func getOfferForCity() {
        getOffers { [weak self] result in
            switch(result) {
            case .success(let offers):
                self?.delegate?.fetchOffers(offers)
            case .failed(let error):
                self?.delegate?.errorOnFetchOffers(error)
            }
        }
    }

    private func getOffers(completion: @escaping(Result<[Offer],APIError>) -> Void) {

        PeixeUrbanoManager.init().client.getCityDeals { result in
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

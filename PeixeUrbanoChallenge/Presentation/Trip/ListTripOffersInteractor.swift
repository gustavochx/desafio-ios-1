//
//  ListTripOffersInteractor.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 26/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit


protocol ListTripOffersInteractorDelegate {
    func didFetchOffers(_ offers: [Offer])
    func errorOnFetchOffers(_ error: Error)
}


class ListTripOffersInteractor {

    var delegate: ListTripOffersInteractorDelegate?

    func getTripOffers() {

        getTrip { [weak self] result in
            switch (result){
            case .success(let offers):
                    self?.delegate?.didFetchOffers(offers)
                case .failed(let error):
                    self?.delegate?.errorOnFetchOffers(error)
            }
        }
        
    }

    private func getTrip(completion: @escaping(Result<[Offer],APIError>)->Void) {
        PeixeUrbanoClient.shared.getTripOffers { result in
            switch(result){
                case .success(let offerResponse):
                    guard let offers = offerResponse.response.deals else {
                        return
                    }
                    completion(Result.success(offers))
                case .failed(let error):
                    completion(Result.failed(error))
            }
        }
    }
}

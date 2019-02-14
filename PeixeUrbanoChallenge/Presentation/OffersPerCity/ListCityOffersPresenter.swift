//
//  ListCityPresenter.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 13/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

protocol ListCityOffersPresenterDelegate: class {
    func didPresent(_ offers: [Offer])
    func errorOnPresent(_ error: Error)
}

struct ListCityOffersPresenter {
    var offers: [Offer]?
    weak var delegate: ListCityOffersPresenterDelegate?
}

extension ListCityOffersPresenter : ListCityOffersInteractorDelegate {

    init(newOffers: [Offer]) {
        self.offers = newOffers
    }

    func fetchOffers(_ offers: [Offer]) {
        self.delegate?.didPresent(offers)
    }

    func errorOnFetchOffers(_ error: Error) {
        self.delegate?.errorOnPresent(error)
    }
    

}

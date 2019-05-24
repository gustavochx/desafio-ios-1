//
//  ListTripOffersPresenter.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 26/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

protocol ListTripOffersPresenterDelegate : class {
    func didPresent(_ offers: [Offer])
    func errorOnPresent(_ error: Error)
}

struct ListTripOffersPresenter  {
    var offers: [Offer]?
    weak var delegate: ListTripOffersPresenterDelegate?
}

extension ListTripOffersPresenter : ListTripOffersInteractorDelegate {

    init(newOffers: [Offer]) {
        self.offers = newOffers
    }

    func offerForIndex(index: Int) -> Offer? {
        return self.offers?[index];
    }

    func didFetchOffers(_ offers: [Offer]) {
        self.delegate?.didPresent(offers)
    }

    func errorOnFetchOffers(_ error: Error) {
        self.delegate?.errorOnPresent(error)
    }

}

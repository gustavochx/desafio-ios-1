//
//  ListProductOfferPresenter.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 24/05/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

protocol ListProductOfferPresenterDelegate : class {
    func didPresent(_ offers: [Offer])
    func errorOnPresent(_ error: APIError)
}

struct ListProductOfferPresenter {
    var offers: [Offer]?
    weak var delegate: ListProductOfferPresenterDelegate?
}

extension ListProductOfferPresenter : ListProductOfferInteractorDelegate {

    init(newOffers: [Offer]) {
        self.offers = newOffers
    }

    func offerForIndex(index: Int) -> Offer? {
        return self.offers?[index];
    }
    
    func didFetchOffers(_ offers: [Offer]) {
        self.delegate?.didPresent(offers)
    }

    func errorOnFetch(_ error: APIError) {
        self.delegate?.errorOnPresent(error)
    }

}



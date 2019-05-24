//
//  PersistanceInterface.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 22/04/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

protocol PersistanceInterface {
    func persistOffers(offers: [Offer],_ result: Bool)
    func returnOffers() -> [Offer]
}

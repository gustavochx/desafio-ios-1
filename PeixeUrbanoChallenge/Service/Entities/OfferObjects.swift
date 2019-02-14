//
//  OfferObjects.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 12/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

struct OfferObjects: Codable {

    var hasMore: Bool?
    var deals: [Offer]?

    enum CodingKeys: String, CodingKey {
        case hasMore = "hasMore"
        case deals = "deals"
    }

    init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        self.hasMore = try data.decode(Bool.self, forKey: .hasMore)
        self.deals = try data.decode([Offer].self, forKey: .deals)
    }

    func encode() -> Data? {
        do {
            let jsonData = try JSONEncoder().encode(self)
            return jsonData
        } catch {
            return nil
        }
    }

}

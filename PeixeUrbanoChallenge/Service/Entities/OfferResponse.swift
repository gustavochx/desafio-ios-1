//
//  Response.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 12/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

struct OfferResponse: Codable {

    var code: Int?
    var response: OfferObjects

    enum CodingsKeys: String, CodingKey {
        case code = "code"
        case response = "response"
    }

    init(newCode: Int, newResponse: OfferObjects) {
        self.code = newCode
        self.response = newResponse
    }

    init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingsKeys.self)
        self.code = try data.decode(Int.self, forKey: .code)//data.decode(Int.self, forKey: .code)
        self.response = try data.decode(OfferObjects.self, forKey: .response)
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

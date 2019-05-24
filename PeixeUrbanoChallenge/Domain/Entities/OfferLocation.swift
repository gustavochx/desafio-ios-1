//
//  OfferLocation.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 12/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

struct OfferLocation: Codable {

    var accountId: String?
    var description: String?
    var name: String?
    var neighborhood: String?
    var address: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var phoneNumber: String?
    var image: String?

    enum CodingKeys: String, CodingKey {
        case accountId = "account_id"
        case description = "description"
        case name = "name"
        case neighborhood = "neighborhood"
        case address = "address"
        case city = "city"
        case state = "state"
        case zipCode = "zip_code"
        case phoneNumber = "phone_number"
        case image = "image"
    }

    init(newAccountId: String, newDescription: String, newName: String, newNeighborhood: String, newAddress: String, newCity: String, newState: String, newZipCode: String, newPhoneNumber: String, newImage: String) {
        self.accountId = newAccountId
        self.description = newDescription
        self.name = newName
        self.neighborhood = newNeighborhood
        self.address = newAddress
        self.city = newCity
        self.state = newState
        self.zipCode = newZipCode
        self.phoneNumber = newPhoneNumber
        self.image = newImage
    }

    init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try data.decode(String.self, forKey: .accountId)
        self.description = try data.decode(String.self, forKey: .description)
        self.name = try data.decode(String.self, forKey: .name)
        self.neighborhood = try data.decode(String.self, forKey: .neighborhood)
        self.address = try data.decode(String.self, forKey: .address)
        self.city = try data.decode(String.self, forKey: .city)
        self.state = try data.decode(String.self, forKey: .state)
        self.zipCode = try data.decode(String.self, forKey: .zipCode)
        self.phoneNumber = try data.decode(String.self, forKey: .phoneNumber)
        self.image = try data.decode(String.self, forKey: .image)
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

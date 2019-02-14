//
//  Offer.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 12/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

struct Offer: Codable {

    var dealId: String?
    var contractId: String?
    var dealType : String?
    var dealCategory: String?
    var pageId: String?
    var title: String?
    var shortTitle: String?
    var images: [OfferImage]?
    var dealCity: String?
    var fullPrice: Double?
    var salePrice: Double?
    var locations: [OfferLocation]?
    //var percentageSaved: Double?
    var dealImage: String?
    var dealOriginalImage: String?

    enum CodingKeys: String, CodingKey {
        case dealId = "deal_id"
        case contractId = "contract_id"
        case dealType = "deal_type"
        case dealCategory = "deal_category"
        case pageId = "page_id"
        case title = "title"
        case shortTitle = "short_title"
        case images = "images"
        case dealCity = "deal_city"
        case fullPrice = "full_price"
        case salePrice = "sale_price"
        case locations = "locations"
       // case percentageSaved = "percentage_saved"
        case dealImage = "dealImage"
        case dealOriginalImage = "dealOriginalImage"
    }

    init(newDealId: String, newContractId: String, newDealType: String, newDealCategory: String, newPageId: String, newTitle: String, newShortTitle: String, newImages: [OfferImage], newDealCity: String, newFullPrice: Double, newSalePrice: Double, newLocations: [OfferLocation], newPercentageSaved: Double, newDealImage: String, newDealOriginalImage: String) {
        self.dealId = newDealId
        self.contractId = newContractId
        self.dealType = newDealType
        self.dealCategory = newDealCategory
        self.pageId = newPageId
        self.title = newTitle
        self.shortTitle = newShortTitle
        self.images = newImages
        self.dealCity = newDealCity
        self.fullPrice = newFullPrice
        self.salePrice = newSalePrice
        self.locations = newLocations
        //self.percentageSaved = newPercentageSaved
        self.dealImage = newDealImage
        self.dealOriginalImage = newDealOriginalImage
    }

    init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        self.dealId = try data.decode(String.self, forKey: .dealId)
        self.contractId = try data.decode(String.self, forKey: .contractId)
        self.dealCategory = try data.decode(String.self, forKey: .dealCategory)
        self.pageId = try data.decode(String.self, forKey: .pageId)
        self.title = try data.decode(String.self, forKey: .title)
        self.shortTitle = try data.decode(String.self, forKey: .shortTitle)
        self.images = try data.decode([OfferImage].self, forKey: .images)
        self.dealCity = try data.decode(String.self, forKey: .dealCity)
        self.fullPrice = try data.decode(Double.self, forKey: .fullPrice)
        self.salePrice = try data.decode(Double.self, forKey: .salePrice)
        self.locations = try data.decode([OfferLocation].self, forKey: .locations)
       // self.percentageSaved = try data.decode(Double.self, forKey: .percentageSaved)
        self.dealImage = try data.decode(String.self, forKey: .dealImage)
        self.dealOriginalImage = try data.decode(String.self, forKey: .dealOriginalImage)
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

//
//  OfferImage.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 12/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

struct OfferImage: Codable {

    var image: String?
    var thumb: String?
    var original: String?

    enum CodingKeys: String,CodingKey {
        case image = "image"
        case thumb = "thumb"
        case original = "original"
    }

    init(newImage: String, newThumb: String, newOriginal: String) {
        self.image = newImage
        self.thumb = newThumb
        self.original = newOriginal
    }

    init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        self.image = try data.decode(String.self, forKey: .image)
        self.thumb = try data.decode(String.self, forKey: .thumb)
        self.original = try data.decode(String.self, forKey: .original)
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

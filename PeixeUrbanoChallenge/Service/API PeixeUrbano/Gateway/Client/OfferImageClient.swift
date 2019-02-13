//
//  OfferImageClient.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 12/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

class OfferImageClient: APIClient {
    
    public let session : URLSession

    let imageCache = NSCache<NSString, UIImage>()

    public init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    public convenience init() {
        self.init(configuration: .default)
    }

    public func callImage(url: URL, completion: @escaping(_ image:UIImage?, _ error: Error?) -> Void) {

        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage,nil)
        } else {
            downloadImage(url: url, completion: completion)
        }

    }

    public func downloadImage(url: URL, completion: @escaping(_ image: UIImage?, _ error: Error?) -> Void) {

    }
}

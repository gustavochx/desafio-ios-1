//
//  UIImageView+Util.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 26/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
var activityIndicator = UIActivityIndicatorView(style: .gray)

extension UIImageView {

    func startLoading() {
        activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        activityIndicator.isUserInteractionEnabled = false

        self.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }

    func stop() {
        activityIndicator.removeFromSuperview()
        activityIndicator.stopAnimating()
    }

    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }

            DispatchQueue.main.async() {
                self.contentMode = mode
                let imageToCache = image
                imageCache.setObject(imageToCache, forKey: url.absoluteString as NSString)
                self.stop()
                self.image = image
            }
            
            }.resume()
    }

    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {

        guard let url = URL(string: link) else {
            return
        }

        startLoading()

        DispatchQueue.global(qos: .background).async { [weak self] in

            guard let self = self else {
                return
            }

            if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage{

                DispatchQueue.main.async() {
                    self.stop()
                    self.image = cachedImage
                }

            } else {
                self.downloaded(from: url, contentMode: mode)
            }
        }

    }
}

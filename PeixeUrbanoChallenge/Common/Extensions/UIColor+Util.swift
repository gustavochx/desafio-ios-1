//
//  UIColor+Util.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 24/05/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

extension UIColor {
    static func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

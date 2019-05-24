//
//  UIViewController+Util.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 24/05/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

extension UIViewController {
    func setNavigationColor() {
        self.navigationController?.navigationBar.barTintColor = UIColor.UIColorFromRGB(rgbValue: 0x2C68C3)
        self.tabBarController?.tabBar.barTintColor =
            UIColor.UIColorFromRGB(rgbValue: 0x2C68C3)
    }
}

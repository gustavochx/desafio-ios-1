//
//  PeixeUrbanoEndpoints.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 12/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit



enum PeixeUrbanoEndpoints {
    case listcityoffers
}

extension PeixeUrbanoEndpoints : Endpoint {

    var baseUrl: String {
        return "https://gist.githubusercontent.com/"
    }

    var path: String {
        switch self {
        case .listcityoffers:
            return "/insidegui/2b1f747ebeb9070e33818bf857e28a84/raw/5da63767fda2ec16f4ae0718e3be4be75001fe10/florianopolis.json"
        }
    }

}

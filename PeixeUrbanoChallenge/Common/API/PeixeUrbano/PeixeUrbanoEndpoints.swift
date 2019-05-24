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
    case listtripoffers
    case listproductoffers
}

extension PeixeUrbanoEndpoints : Endpoint {

    var baseUrl: String {
        return "https://gist.githubusercontent.com/"
    }

    var path: String {
        switch self {
            case .listcityoffers:
                return "/insidegui/2b1f747ebeb9070e33818bf857e28a84/raw/5da63767fda2ec16f4ae0718e3be4be75001fe10/florianopolis.json"
            case .listtripoffers:
                return "/insidegui/d2665b556f2be1b1ad3a19d2ef9bcc44/raw/afe1e0a9563e3bcddc3796b22becb8f12f82ee2e/viagens.json"
            case .listproductoffers:
                return "/insidegui/007fd6664650391dca199e6784d1f351/raw/862d701c69307f9e9053f8cb1ec438586fca4b64/produtos.json"

        }
    }



}

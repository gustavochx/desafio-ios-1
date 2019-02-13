//
//  ViewController.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 12/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        PeixeUrbanoManager.init().client.getCityDeals { (result) in
            switch(result) {
            case .sucess(let offerResponse):
                print("Success -> %@",offerResponse)
            case .failed(let error):
                print("APIError -> %@",error)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

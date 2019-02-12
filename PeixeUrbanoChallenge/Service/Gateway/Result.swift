//
//  Result.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 12/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

public enum Result<T,U> where U: Error {
    case sucess(T)
    case failed(U)
}

//
//  Result.swift
//  Fruits
//
//  Created by Or.Avraham on 17/03/2022.
//

import Foundation

enum Result<T, U: Error> {
    case success(payload: T)
    case failure(U)
}

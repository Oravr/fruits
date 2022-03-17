//
//  Fruit.swift
//  Fruits
//
//  Created by Or.Avraham on 17/03/2022.
//

import Foundation

struct Fruits: Codable {
    let fruits: [Fruit]
    let err: Int
}

struct Fruit: Codable {
    let name: String
    let image: String
    let description: String
    let price: Double
}

//
//  Model.swift
//  AlexBeerShop_MVVM
//
//  Created by Alex on 06.06.2024.
//

import Foundation

struct BeersModel: Codable {
    let beers: [SingleBeer]
}

struct SingleBeer: Codable {
    let id: Int
    let name: String
    let description: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case imageURL = "imageUrl"
    }
}

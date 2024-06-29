//
//  SearchByIdVewModel.swift
//  AlexBeerShop_MVVM
//
//  Created by Alex on 29.06.2024.
//

import Foundation

class SearchByIdVewModel {
    let networkRequest = NetworkRequest()    
    var beerById: ((SingleBeer?) -> Void)?

     func fetchBeerById(inputId: Int, completion: @escaping (SingleBeer?) -> Void) {
        DispatchQueue.main.async { [weak self] in
            self?.networkRequest.searchByID(id: inputId) { beer in
                completion(beer)
            }
        }
    }
}

//
//  RandomBeerViewModel.swift
//  AlexBeerShop_MVVM
//
//  Created by Alex on 29.06.2024.
//

import Foundation


class RandomBeerViewModel {
    let networkRequest = NetworkRequest()
    var randomBeer: ((SingleBeer?) -> Void)?

     func fetchRandomBeer(completion: @escaping (SingleBeer?) -> Void) {
        DispatchQueue.main.async { [weak self] in
            self?.networkRequest.getRandomBeer { beer in
                completion(beer)
            }
        }
    }
}

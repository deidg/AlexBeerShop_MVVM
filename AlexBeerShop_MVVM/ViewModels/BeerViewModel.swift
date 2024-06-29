//
//  BeerViewModel.swift
//  AlexBeerShop_MVVM
//
//  Created by Alex on 17.06.2024.
//

import Foundation



class BeerViewModel {
    
    let networkRequest = NetworkRequest()
    
    var updateView: (([SingleBeer]?) -> Void)?
    var beerById: ((SingleBeer?) -> Void)?
    
    init() {
        fetchBeerListForSetup()
    }
    
    private func fetchBeerListForSetup() {
        DispatchQueue.main.async { [weak self] in
            self?.networkRequest.getBeerList { beersModel in
                self?.updateView?(beersModel)
            }
        }
    
    }
    
     func fetchBeerById(inputId: Int, completion: @escaping (SingleBeer?) -> Void) {
        DispatchQueue.main.async { [weak self] in
            self?.networkRequest.searchByID(id: inputId) { beer in
                completion(beer)
            }
        }
    }
}

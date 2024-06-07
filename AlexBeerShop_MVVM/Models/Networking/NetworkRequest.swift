//
//  NetworkRequest.swift
//  AlexBeerShop_MVVM
//
//  Created by Alex on 06.06.2024.
//

import Foundation

protocol NetworkService {
    func getBeerList(completion: (([SingleBeer]) -> Void)?)
    func searchBeerByID(id: Int, completion: @escaping (SingleBeer?) -> Void?)
    func getRandomBeer(completion: @escaping (SingleBeer?) -> Void?)
}


class NetworkRequest {
    
    func getBeerList(completion: (([SingleBeer]) -> Void)?) {
        if let sourceUrl = Bundle.main.url(forResource: "BeerDataSet", withExtension: ".json") {
            do {
                let data = try Data (contentsOf: sourceUrl)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(BeersModel.self, from: data)
                completion?(jsonData.beers)
            } catch {
                print("error:\(error.localizedDescription)")
            }
        }
    }
    
    func searchByID(id: Int, completion: @escaping (SingleBeer?) -> Void) {
        if let sourceUrl = Bundle.main.url(forResource: "BeerDataSet", withExtension: ".json") {
            do {
                let data = try Data(contentsOf: sourceUrl)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(BeersModel.self, from: data)
                completion(jsonData.beers[id-1])
            } catch {
                print("error:\(error.localizedDescription)")
            }
        }
    }
    
    func getRandomBeer(completion: @escaping (SingleBeer) -> Void?) {
        let randomInt = Int.random(in: 0..<25)
        if let sourceUrl = Bundle.main.url(forResource: "BeerDataSet", withExtension: ".json") {
            do {
                let data = try Data(contentsOf: sourceUrl)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(BeersModel.self, from: data)
                completion(jsonData.beers[randomInt])
            } catch {
                print("error:\(error.localizedDescription)")
            }
        }
    }
}

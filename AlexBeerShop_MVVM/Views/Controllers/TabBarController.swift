//
//  TabBarController.swift
//  AlexBeerShop_MVVM
//
//  Created by Alex on 09.06.2024.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        generateTabs()
    }
  
    private func generateTabs() {
        let beerListVC = UINavigationController(rootViewController: BeerListVC())
        let searchVC = UINavigationController(rootViewController: SearchVC())
        let randomBeerVC = UINavigationController(rootViewController: RandomBeerVC())

        beerListVC.tabBarItem = UITabBarItem(title: "Beers list", image: UIImage(systemName: "1.circle"), tag: 0)
        searchVC.tabBarItem = UITabBarItem(title: "Search by ID", image: UIImage(systemName: "2.circle"), tag: 0)
        randomBeerVC.tabBarItem = UITabBarItem(title: "Random beer", image: UIImage(systemName: "3.circle"), tag: 0)

        viewControllers = [beerListVC, searchVC, randomBeerVC]
        
    }
}

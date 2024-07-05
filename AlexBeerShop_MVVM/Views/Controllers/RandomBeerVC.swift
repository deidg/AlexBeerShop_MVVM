//
//  RandomBeerVC.swift
//  AlexBeerShop_MVVM
//
//  Created by Alex on 09.06.2024.
//

import UIKit
import SnapKit

final class RandomBeerVC: UIViewController {
    //MARK: - Elements
    private let randomBeerViewModel  = RandomBeerViewModel()
    private let beerViewTamplate = DetailBeerView()
    private let randomButton: UIButton = {
        let randomButton = UIButton()
        randomButton.backgroundColor = .orange
        randomButton.setTitle("Random beer search", for: .normal)
        randomButton.isEnabled = true
        return randomButton
    }()
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        setupUI()
        addTargets()
    }
    //MARK: - SetupUI
    private func setupVC() {
        view.backgroundColor = .white
        title = "Random beer"
        beerViewTamplate.isHidden = true
    }
    private func setupUI() {
        view.addSubview(beerViewTamplate)
        beerViewTamplate.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        view.addSubview(randomButton)
        randomButton.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view).inset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(30)
        }
    }
    //MARK: - Private methods
    private func addTargets() {
        randomButton.addTarget(self, action: #selector(getRandomBeer), for: .touchUpInside)
    }
    //MARK: - @objc methods
    @objc private func getRandomBeer() {
        randomBeerViewModel.fetchRandomBeer { randomBeer in
            guard let randomBeer = randomBeer else { return }
            self.beerViewTamplate.configureView(singleBeer: randomBeer)
            self.beerViewTamplate.isHidden = false
        }
    }
}

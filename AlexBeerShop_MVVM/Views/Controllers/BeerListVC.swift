//
//  BeerListVC.swift
//  AlexBeerShop_MVVM
//
//  Created by Alex on 09.06.2024.
//

import UIKit
import SnapKit
import Kingfisher


final class BeerListVC: UIViewController {
    //MARK: - Elements
    private var beersList = [SingleBeer]()
    private let viewModel = BeerViewModel()
    private let beersTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(BeerCell.self, forCellReuseIdentifier: "beerCell")
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        setupUI()
        setupDelegates()
//        viewModel.fetchBeerListForSetup()
        setupBindings()
    }
    //MARK: - Private methods
    func setupVC() {
        view.backgroundColor = .white
        title = "Beer list"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupUI() {
        view.addSubview(beersTableView)
        beersTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setupDelegates() {
        beersTableView.dataSource = self
        beersTableView.delegate = self
    }
    
    //MARK: - Methods
    func setupBindings() {
        viewModel.updateView = { [weak self] beer in
            guard let self = self, let beer = beer else { return }
            self.beersList = beer
            beersTableView.reloadData()
        }
    }
    
    private func presentDetailVC(for beer: SingleBeer) {
        let detailVC = DetailVC(beer: beer)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // MARK: - @objc methods
    @objc private func dismissDetailVC() {
        dismiss(animated: true)
    }    
    //MARK: - Extensions - Delegates
    
}

extension BeerListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "beerCell", for: indexPath) as? BeerCell else {
            return UITableViewCell()
        }
        cell.setupView(model: beersList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBeer = beersList[indexPath.row]
        presentDetailVC(for: selectedBeer)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
//extension BeerListVC:

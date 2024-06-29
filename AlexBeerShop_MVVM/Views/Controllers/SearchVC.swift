//
//  SearchVC.swift
//  AlexBeerShop_MVVM
//
//  Created by Alex on 09.06.2024.
//


import UIKit
import SnapKit
import Kingfisher


final class SearchVC: UIViewController {
    //MARK: - Elements
    private let searchController = UISearchController(searchResultsController: nil)
    private let beerViewTamplate = DetailBeerView()
    private let searchByIdVewModel = SearchByIdVewModel()
    private let onBoardLabel: UILabel = {
        let onBoardLabel = UILabel()
        onBoardLabel.text = "Enter beer ID (from 1 to 25)"
        return onBoardLabel
    }()
    // MARK: - Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationTitle()
        setupVC()
        setupViewTemplate()
        setupOnboardLabel()
        setupSearchContoller()
    }
    //MARK: - SetupUI
    private func setupNavigationTitle() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Search beer by ID"
    }
    
    private func setupVC() {
        view.backgroundColor = .white
    }
    
    private func setupViewTemplate() {
        view.addSubview(beerViewTamplate)
        beerViewTamplate.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setupOnboardLabel() {
        view.addSubview(onBoardLabel)
        onBoardLabel.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
    }
    
    private func setupSearchContoller() {
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.keyboardType = .numberPad
    }
}
//MARK: - Extensions - Delegates
extension SearchVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let inputId = Int(searchController.searchBar.text ?? "") else { return }
        if inputId > 0 && inputId < 26 {
            searchByIdVewModel.fetchBeerById(inputId: inputId) { [weak self] (singleBeer: SingleBeer?) in
                guard let self = self, let beer = singleBeer else { return }
                self.beerViewTamplate.isHidden = false
                self.onBoardLabel.isHidden = true
                beerViewTamplate.configureView(singleBeer: beer)
            }
        } else {
            beerViewTamplate.isHidden = true
            onBoardLabel.isHidden = false
            onBoardLabel.text = "Beer ID should be from 1 to 25"
            onBoardLabel.textColor = .red
        }
    }
}



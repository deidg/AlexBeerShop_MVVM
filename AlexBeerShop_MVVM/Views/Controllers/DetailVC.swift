//
//  DetailVC.swift
//  AlexBeerShop_MVVM
//
//  Created by Alex on 13.06.2024.
//

import UIKit
import SnapKit
import Kingfisher


final class DetailVC: UIViewController {
    //MARK: - Elements
    private let beers: [SingleBeer] = []
    private let beerImage: UIImageView = {
        let beerImage = UIImageView()
        beerImage.contentMode = .scaleAspectFit
        beerImage.snp.makeConstraints { make in
            make.height.equalTo(300)
        }
        return beerImage
    }()
    private let idLabel: UILabel = {
        let idLabel = UILabel()
        idLabel.textColor = .orange
        idLabel.font = .boldSystemFont(ofSize: 20)
        return idLabel
    }()
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textColor = .gray
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    private lazy var nameStackView: UIStackView = {
        let nameStackView = UIStackView(arrangedSubviews: [idLabel, nameLabel, descriptionLabel])
        nameStackView.axis = .vertical
        nameStackView.alignment = .center
        nameStackView.spacing = Constants.nameStackViewstackSpacing
        return nameStackView
    }()
    private lazy var mainStackView: UIStackView = {
        let mainStackView = UIStackView(arrangedSubviews: [beerImage, nameStackView])
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = Constants.mainStackViewstackSpacing
        return mainStackView
    }()
    //MARK: - Lifecycle
    init(beer: SingleBeer) {
        super.init(nibName: nil, bundle: nil)
        configureView(with: beer)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        setupUI()
    }
    //MARK: - SetupUI
    private func setupVC() {
        view.backgroundColor = .white
    }
    
    private func setupUI() {
        view.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(5)
        }
    }
    //MARK: - Private methods
    //MARK: - Public methods
    func configureView(with beer: SingleBeer) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let imageURL = URL(string: beer.imageURL)
            beerImage.kf.setImage(with: imageURL)
            idLabel.text = "\(beer.id)"
            nameLabel.text = beer.name
            descriptionLabel.text = beer.description
        }
    }
}

//MARK: - @objc methods


//MARK: - Extensions - Delegates


// MARK: - Constants
extension DetailVC {
    enum Constants {
        static let idLabelFontSize: CGFloat = 15.0
        static let nameStackViewstackSpacing: CGFloat = 2.0
        static let mainStackViewstackSpacing: CGFloat = 10.0
        static let padding: CGFloat = 16.0
    }
}






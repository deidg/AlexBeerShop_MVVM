//
//  DetailBeerView.swift
//  AlexBeerShop_MVVM
//
//  Created by Alex on 25.06.2024.
//

import UIKit
import SnapKit
import Kingfisher

final class DetailBeerView: UIView {
    //MARK: - Elements
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
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    //MARK: - Private methods
    private func setupLabels() {
        addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.trailing.leading.equalTo(safeAreaLayoutGuide).inset(10)
        }
    }
    //MARK: - Public methods
    func configureView(singleBeer: SingleBeer) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let imageURL = URL(string: singleBeer.imageURL)
            beerImage.kf.setImage(with: imageURL)
            idLabel.text = "\(singleBeer.id)"
            descriptionLabel.text = singleBeer.description
        }
    }
}
    // MARK: - Constants
    extension DetailBeerView {
        enum Constants {
            static let idLabelFontSize: CGFloat = 15.0
            static let nameStackViewstackSpacing: CGFloat = 2.0
            static let mainStackViewstackSpacing: CGFloat = 10.0
            static let padding: CGFloat = 16.0
        }
}

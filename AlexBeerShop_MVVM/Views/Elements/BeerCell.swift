//
//  BeerCell.swift
//  AlexBeerShop_MVVM
//
//  Created by Alex on 09.06.2024.
//

import UIKit
import SnapKit
import Kingfisher

final class BeerCell: UITableViewCell {
    
    //MARK: - Elements
    private let beerImage: UIImageView = {
        let beerImage = UIImageView()
        beerImage.contentMode = .scaleAspectFit
        beerImage.snp.makeConstraints { make in
            make.height.width.equalTo(100)
        }
        return beerImage
    }()
    private let idLabel: UILabel = {
        let idLabel = UILabel()
        idLabel.textColor = .orange
        idLabel.text = "ID"
        idLabel.font = .boldSystemFont(ofSize: 12)
        return idLabel
    }()
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "BeerName"
        return nameLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 3
        descriptionLabel.textColor = UIColor.gray
        //        descriptionLabel.font = .systemFont(ofSize: 16, weight: .regular)
        descriptionLabel.text = "Description"
        return descriptionLabel
    }()
    
    private lazy var nameStackView: UIStackView = {
        let nameStackView = UIStackView(arrangedSubviews: [idLabel, nameLabel, descriptionLabel])
        nameStackView.axis = .vertical
        nameStackView.alignment = .top
        return nameStackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let mainStackView = UIStackView(arrangedSubviews: [beerImage, nameStackView])
        mainStackView.axis = .horizontal
        mainStackView.distribution = .fill
        mainStackView.spacing = Constants.stackSpacing
        return mainStackView
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    //MARK: - Private methods
    func setupCellUI() {
        addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(Constants.padding)
            make.bottom.equalToSuperview().inset(Constants.padding).priority(.high)
        }
    }
    
    //MARK: - Public methods
    func setupView(model: SingleBeer) {
        DispatchQueue.main.async {
            self.beerImage.kf.setImage(with: URL(string: model.imageURL))
            self.idLabel.text = String(model.id)
            self.nameLabel.text = model.name
            self.descriptionLabel.text = model.description
        }
    }
}
//MARK: - Extensions - Delegates

// MARK: - Constants
extension BeerCell {
    enum Constants {
        static let stackSpacing: CGFloat = 10.0
        static let padding: CGFloat = 16.0
    }
}


//
//  CharactersCell.swift
//  RickAndMorty
//
//  Created by João Marcos Jordão on 08/04/25.
//

import UIKit

class CharactersCell: UITableViewCell {
    
    lazy var characterImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return image
    }()
    
    lazy var charactersNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var characterStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            characterImageView,
            charactersNameLabel,
        ])
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
       }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    func didClickCharacterContent() {
        
    }
}

extension CharactersCell: ViewCode {
    func setupView() {
        addSubviews()
        setupConstrains()
        setupStyle()
    }
    
    func addSubviews() {
        self.contentView.addSubview(characterStackView)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            characterStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),

            characterStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            characterStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            characterStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
    }
    
    func setupStyle() {
        self.contentView.backgroundColor = .white

    }
}

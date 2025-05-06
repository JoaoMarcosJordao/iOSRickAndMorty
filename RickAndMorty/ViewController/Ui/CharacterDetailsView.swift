//
//  CharacterDetailsView.swift
//  RickAndMorty
//
//  Created by João Marcos Jordão on 21/04/25.
//

import UIKit

class CharacterDetailsView: UIViewController {
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

    lazy var charactersStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var characterSpecie: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
    
    lazy var characterGender: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
    
    lazy var characterLocation: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
    
    lazy var characterOrigin: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
}

extension CharacterDetailsView: ViewCode {
    func setupView() {
        addSubviews()
        setupConstrains()
        setupStyle()
    }
    
    func addSubviews() {
        self.view.addSubview(characterImageView)
        self.view.addSubview(charactersNameLabel)
        self.view.addSubview(charactersStatusLabel)
        self.view.addSubview(characterSpecie)
        self.view.addSubview(characterGender)
        self.view.addSubview(characterLocation)
        self.view.addSubview(characterOrigin)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8),
            characterImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
            characterImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            charactersNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 16),
            charactersNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            charactersNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            charactersStatusLabel.topAnchor.constraint(equalTo: charactersNameLabel.bottomAnchor, constant: 16),
            charactersStatusLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            charactersStatusLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            characterSpecie.topAnchor.constraint(equalTo: charactersStatusLabel.bottomAnchor, constant: 16),
            characterSpecie.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            characterSpecie.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            characterGender.topAnchor.constraint(equalTo: characterSpecie.bottomAnchor, constant: 16),
            characterGender.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            characterGender.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            characterLocation.topAnchor.constraint(equalTo: characterGender.bottomAnchor, constant: 16),
            characterLocation.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            characterLocation.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            
            characterOrigin.topAnchor.constraint(equalTo: characterLocation.bottomAnchor, constant: 16),
            characterOrigin.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            characterOrigin.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
        ])
    }
    
    func setupStyle() {
        self.view.backgroundColor = .white
    }
}

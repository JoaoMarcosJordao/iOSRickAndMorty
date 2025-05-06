//
//  ViewController.swift
//  RickAndMorty
//
//  Created by João Marcos Jordão on 23/03/25.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var characterData: [Character]? = []
    
    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.startAnimating()
        spinner.color = .black
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let charactersViewModel = CharactersViewModelImpl()
        charactersViewModel.getCharacters()
        charactersViewModel.delegate = self
        
        setupTableView()
        setupView()
    }
    
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CharactersCell.self, forCellReuseIdentifier: "CharactersCell")
    }
}

extension ViewController: CharactersViewModelDelegate {
    func charactersDidLoad(_ characters: [Character]) {
        DispatchQueue.main.async {
            self.characterData? = characters
            self.spinner.stopAnimating()
            self.spinner.removeFromSuperview()
            self.tableView.reloadData()
        }
    }
    
    func charactersDidFailToLoad(with error: any Error) {
        return
    }
}

extension ViewController: ViewCode {
    func setupView() {
        addSubviews()
        setupConstrains()
        setupStyle()
    }
    
    func addSubviews() {
        view.addSubview(spinner)
        view.addSubview(tableView)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupStyle() {
        view.backgroundColor = .white
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characterData!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharactersCell", for: indexPath) as? CharactersCell else {
            return UITableViewCell()
        }
        
        if let url = URL(string: self.characterData?[indexPath.row].image ?? "")  {
            URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            cell.characterImageView.image = image
                        }
                    } else {
                        DispatchQueue.main.async {
                            print("error url image")
                        }
                    }
                }.resume()
            }
        cell.charactersNameLabel.text = self.characterData?[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characterDetailsView = CharacterDetailsView()
        
        if let url = URL(string: self.characterData?[indexPath.row].image ?? "")  {
            URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            characterDetailsView.characterImageView.image = image
                        }
                    } else {
                        DispatchQueue.main.async {
                            print("error url image")
                        }
                    }
                }.resume()
            }
        
        characterDetailsView.charactersNameLabel.text = self.characterData?[indexPath.row].name
        
        characterDetailsView.charactersStatusLabel.text = self.characterData?[indexPath.row].status
        
        characterDetailsView.characterSpecie.text = self.characterData?[indexPath.row].species
        
        characterDetailsView.characterGender.text = self.characterData?[indexPath.row].gender
        
        characterDetailsView.characterLocation.text = self.characterData?[indexPath.row].location?.name
        
        characterDetailsView.characterOrigin.text = self.characterData?[indexPath.row].origin?.name

        self.present(characterDetailsView, animated: true)
        
    }
}

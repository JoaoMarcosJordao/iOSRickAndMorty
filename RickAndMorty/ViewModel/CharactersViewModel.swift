//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by João Marcos Jordão on 23/03/25.
//

protocol CharactersViewModel {
    func getCharacters()
}

protocol CharactersViewModelDelegate: AnyObject {
    func charactersDidLoad(_ characters: [Character])
    func charactersDidFailToLoad(with error: Error)
}

class CharactersViewModelImpl: CharactersViewModel {
    private let charactersService = CharactersServiceImpl()
    
    weak var delegate: CharactersViewModelDelegate?
    
    
    func getCharacters() {
        charactersService.getCharacters{ result in
            switch result {
            case .success(let characters):
                self.delegate?.charactersDidLoad(characters.results ?? [])
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

//
//  CharactersDataResponse.swift
//  RickAndMorty
//
//  Created by João Marcos Jordão on 23/03/25.
//

struct CharactersDataResponse: Decodable {
    let results: [Character]?
}

struct Character: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let origin: CharacterOrigin?
    let location: CharacterLocation?
    let image: String?
}

struct CharacterLocation: Decodable {
    let name: String?
}

struct CharacterOrigin: Decodable {
    let name: String?
}

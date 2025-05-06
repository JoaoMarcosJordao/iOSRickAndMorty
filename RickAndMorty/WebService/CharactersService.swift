//
//  CharactersService.swift
//  RickAndMorty
//
//  Created by João Marcos Jordão on 23/03/25.
//

import Foundation


enum ServiceError: Error {
    case invalidURL
    case invalidRequest
    case invalidData
    case invalidDecodingData
}

protocol CharactersService: AnyObject {
    func getCharacters(completion: @escaping (Result<CharactersDataResponse, ServiceError>) -> Void)
}

class CharactersServiceImpl: CharactersService {
    func getCharacters(completion: @escaping (Result<CharactersDataResponse, ServiceError>) -> Void) {
        let path = "https://rickandmortyapi.com/api/character"
               
        guard let url = URL(string: path) else {
            print("URL inválida")
            completion(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Erro: \(error)")
                completion(.failure(.invalidRequest))
                return
            }
            guard let data = data else {
                print("Nenhum dado retornado")
                completion(.failure(.invalidData))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(CharactersDataResponse.self, from: data)
                completion(.success(decodedData))
            } catch {
                print("Erro ao decodificar os dados: \(error)")
                completion(.failure(.invalidDecodingData))
            }
        }
    task.resume()
    }
}

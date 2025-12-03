//
//  CharacterService.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

protocol CharacterServiceProtocol {
    func getListOfCharacters(number: Int, size: Int) async throws -> GetListOfCharactersResponse
    func getListOfCharactersDescending(number: Int, size: Int) async throws -> GetListOfCharactersResponse
    func getCharacterByID(characterID: String) async throws -> GetSingleCharacterResponse
}

struct CharacterService: CharacterServiceProtocol {
    func getListOfCharacters(number: Int, size: Int) async throws -> GetListOfCharactersResponse {
        let endpoint = "https://api.potterdb.com/v1/characters?page[number]=\(number)&page[size]=\(size)&sort=name"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(GetListOfCharactersResponse.self, from: data)
            return result
        } catch {
            throw NetworkingError.invalidData
        }
    }
    
    func getListOfCharactersDescending(number: Int, size: Int) async throws -> GetListOfCharactersResponse {
        let endpoint = "https://api.potterdb.com/v1/characters?page[number]=\(number)&page[size]=\(size)&sort=-name"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(GetListOfCharactersResponse.self, from: data)
            return result
        } catch {
            throw NetworkingError.invalidData
        }
    }
    
    func getCharacterByID(characterID: String) async throws -> GetSingleCharacterResponse {
        let endpoint = "https://api.potterdb.com/v1/characters/\(characterID)"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(GetSingleCharacterResponse.self, from: data)
            return result
        } catch {
            throw NetworkingError.invalidData
        }
    }
    
    
}

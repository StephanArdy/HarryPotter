//
//  SpellService.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

protocol SpellServiceProtocol {
    func getListOfSpells(number: Int, size: Int) async throws -> GetListOfSpellsResponse
    func getSpellByID(spellID: String) async throws -> GetSingleSpellResponse
}

class SpellService: SpellServiceProtocol {
    
    static let env = EnvironmentManager.standard
    let harryPotterAPIKey = CharacterService.env.endpoint
    
    func getListOfSpells(number: Int, size: Int) async throws -> GetListOfSpellsResponse {
        let endpoint = "\(harryPotterAPIKey ?? "")spells?page[number]=\(number)&page[size]=\(size)"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(GetListOfSpellsResponse.self, from: data)
            return result
        } catch {
            throw NetworkingError.invalidData
        }
    }
    
    func getSpellByID(spellID: String) async throws -> GetSingleSpellResponse {
        let endpoint = "\(harryPotterAPIKey ?? "")spells/\(spellID)"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(GetSingleSpellResponse.self, from: data)
            return result
        } catch {
            throw NetworkingError.invalidData
        }
    }
    
    
}

//
//  PotionService.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

protocol PotionServiceProtocol {
    func getListOfPotions(number: Int, size: Int) async throws -> GetListOfPotionsResponse
    func getPotionByID(potionID: String) async throws -> GetSinglePotionResponse
}

class PotionService: PotionServiceProtocol {
    func getListOfPotions(number: Int, size: Int) async throws -> GetListOfPotionsResponse {
        let endpoint = "https://api.potterdb.com/v1/potions?page[number]=\(number)&page[size]=\(size)"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(GetListOfPotionsResponse.self, from: data)
            return result
        } catch {
            throw NetworkingError.invalidData
        }
    }
    
    func getPotionByID(potionID: String) async throws -> GetSinglePotionResponse {
        let endpoint = "https://api.potterdb.com/v1/potions/\(potionID)"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(GetSinglePotionResponse.self, from: data)
            return result
        } catch {
            throw NetworkingError.invalidData
        }
    }
    
    
}

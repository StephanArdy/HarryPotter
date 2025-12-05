//
//  MovieService.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

protocol MovieServiceProtocol {
    func getListOfMovies() async throws -> GetListOfMoviesResponse
    func getMovieByID(movieID: String) async throws -> GetSingleMovieResponse
    func getRandomMovie() async throws -> GetListOfMoviesResponse
}

class MovieService: MovieServiceProtocol {
    
    static let env = EnvironmentManager.standard
    let harryPotterAPIKey = CharacterService.env.endpoint
    
    func getListOfMovies() async throws -> GetListOfMoviesResponse {
        let endpoint = "\(harryPotterAPIKey ?? "")movies/"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(GetListOfMoviesResponse.self, from: data)
            return result
        } catch {
            throw NetworkingError.invalidData
        }
    }
    
    func getMovieByID(movieID: String) async throws -> GetSingleMovieResponse {
        let endpoint = "\(harryPotterAPIKey ?? "")movies/\(movieID)"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(GetSingleMovieResponse.self, from: data)
            return result
        } catch {
            throw NetworkingError.invalidData
        }
    }
    
    func getRandomMovie() async throws -> GetListOfMoviesResponse {
        let endpoint = "\(harryPotterAPIKey ?? "")movies?page[size]=3"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(GetListOfMoviesResponse.self, from: data)
            return result
        } catch {
            throw NetworkingError.invalidData
        }
    }
    
    
}

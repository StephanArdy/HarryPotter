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
}

class MovieService: MovieServiceProtocol {
    func getListOfMovies() async throws -> GetListOfMoviesResponse {
        let endpoint = "https://api.potterdb.com/v1/movies/"
        
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
        let endpoint = "https://api.potterdb.com/v1/movies/\(movieID)"
        
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
    
    
}

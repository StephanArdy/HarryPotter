//
//  BookService.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

protocol BookServiceProtocol {
    func getListOfBooks() async throws -> GetListOfBooksResponse
    func getBookByID(bookID: String) async throws -> GetSingleBookResponse
    func getListOfChapters(bookID: String) async throws -> GetListOfChaptersResponse
    func getChapterOfBook(bookID: String, chapterID: String) async throws -> GetSingleChapterResponse
    func getRandomBook() async throws -> GetListOfBooksResponse
}

class BookService: BookServiceProtocol {
    
    static let env = EnvironmentManager.standard
    let harryPotterAPIKey = CharacterService.env.endpoint
    
    func getListOfBooks() async throws -> GetListOfBooksResponse {
        let endpoint = "\(harryPotterAPIKey ?? "")books/"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(GetListOfBooksResponse.self, from: data)
            return result
        } catch {
            throw NetworkingError.invalidData
        }
    }
    
    func getBookByID(bookID: String) async throws -> GetSingleBookResponse {
        let endpoint = "\(harryPotterAPIKey ?? "")books/\(bookID)"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(GetSingleBookResponse.self, from: data)
            return result
        } catch {
            throw NetworkingError.invalidData
        }
    }
    
    func getListOfChapters(bookID: String) async throws -> GetListOfChaptersResponse {
        let endpoint = "\(harryPotterAPIKey ?? "")books/\(bookID)/chapters"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(GetListOfChaptersResponse.self, from: data)
            return result
        } catch {
            throw NetworkingError.invalidData
        }
    }
    
    func getChapterOfBook(bookID: String, chapterID: String) async throws -> GetSingleChapterResponse {
        let endpoint = "\(harryPotterAPIKey ?? "")books/\(bookID)/chapters/\(chapterID)"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(GetSingleChapterResponse.self, from: data)
            return result
        } catch {
            throw NetworkingError.invalidData
        }
    }
    
    func getRandomBook() async throws -> GetListOfBooksResponse {
        let endpoint = "\(harryPotterAPIKey ?? "")books?page[size]=3"
        
        guard let url = URL(string: endpoint) else { throw NetworkingError.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkingError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(GetListOfBooksResponse.self, from: data)
            return result
        } catch {
            throw NetworkingError.invalidData
        }
    }
    
    
    
}

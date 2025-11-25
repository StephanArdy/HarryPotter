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
}

class BookService: BookServiceProtocol {
    
    func getListOfBooks() async throws -> GetListOfBooksResponse {
        let endpoint = "https://api.potterdb.com/v1/books/"
        
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
        let endpoint = "https://api.potterdb.com/v1/books/\(bookID)"
        
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
        let endpoint = "https://api.potterdb.com/v1/books/\(bookID)/chapters"
        
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
        let endpoint = "https://api.potterdb.com/v1/books/\(bookID)/chapters/\(chapterID)"
        
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
    
    
    
}

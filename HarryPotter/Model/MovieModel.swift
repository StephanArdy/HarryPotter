//
//  MovieModel.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

struct MovieModel: Codable {
    let boxOffice: String
    let budget: String
    let cinematographers: [String]
    let directors: [String]
    let distributors: [String]
    let editors: [String]
    let musicComposers: [String]
    let poster: String
    let producers: [String]
    let rating: String
    let releaseDate: String
    let runningTime: String
    let screenwriters: [String]
    let slug: String
    let summary: String
    let title: String
    let trailer: String
    let wiki: String
}

struct GetMovieDataResponse: Codable, Identifiable {
    let id: String
    let type: String
    let attributes: MovieModel
    let links: LinksResponse
}

struct GetListOfMoviesResponse: Codable {
    let data: [GetMovieDataResponse]
    let meta: Meta
    let links: Links
}

struct GetSingleMovieResponse: Codable {
    let data: GetMovieDataResponse
    let meta: Meta
    let links: Links
}

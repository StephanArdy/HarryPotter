//
//  BookModel.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

struct BookModel: Codable {
    let author: String
    let cover: String
    let dedication: String
    let pages: Int
    let releaseDate: String
    let summary: String
    let slug: String
    let title: String
    let wiki: String
}

struct BookData: Codable {
    let id: String
    let type: String
}

struct BookChapterData: Codable {
    let data: [ChapterData]
}

struct BookChapter: Codable {
    let chapters: BookChapterData
}

struct GetBookDataResponse: Codable, Identifiable {
    let id: String
    let type: String
    let attributes: BookModel
    let relationships: BookChapter
    let links: LinksResponse
}

struct GetListOfBooksResponse: Codable {
    let data: [GetBookDataResponse]
    let meta: Meta
    let links: Links
}

struct GetSingleBookResponse: Codable {
    let data: GetBookDataResponse
    let meta: Meta
    let links: Links
}



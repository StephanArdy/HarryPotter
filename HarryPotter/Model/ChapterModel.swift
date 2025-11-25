//
//  ChapterModel.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

struct ChapterModel: Codable {
    let order: Int
    let slug: String
    let summary: String
    let title: String
}

struct ChapterData: Codable {
    let id: String
    let type: String
}

struct ChapterBookData: Codable {
    let data: BookData
}

struct ChapterBook: Codable {
    let book: ChapterBookData
}

struct GetChapterDataResponse: Codable {
    let id: String
    let type: String
    let attributes: ChapterModel
    let relationships: ChapterBook
    let links: LinksResponse
}

struct GetListOfChaptersResponse: Codable {
    let data: [GetChapterDataResponse]
    let meta: Meta
    let links: Links
}

struct GetSingleChapterResponse: Codable {
    let data: GetChapterDataResponse
    let meta: Meta
    let links: Links
}

//
//  UtilsModel.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

struct Meta: Codable {
    let pagination: Pagination?
    let copyright: String
    let generatedAt: String
}

struct Pagination: Codable {
    let current: Int
    let next: Int?
    let last: Int?
    let records: Int
}

struct Links: Codable {
    let `self`: String
    let current: String?
    let next: String?
    let last: String?
}

struct LinksResponse: Codable {
    let `self`: String
}

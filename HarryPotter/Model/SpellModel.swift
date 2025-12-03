//
//  SpellModel.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

struct SpellModel: Codable {
    let category: String?
    let creator: String?
    let effect: String?
    let hand: String?
    let image: String?
    let incantation: String?
    let light: String?
    let name: String?
    let slug: String?
    let wiki: String?
}

struct GetSpellDataResponse: Codable, Identifiable {
    let id: String
    let type: String
    let attributes: SpellModel
    let links: LinksResponse
}

struct GetListOfSpellsResponse: Codable {
    var data: [GetSpellDataResponse]
    var meta: Meta
    var links: Links
}

struct GetSingleSpellResponse: Codable {
    let data: GetSpellDataResponse
    let meta: Meta
    let links: Links
}

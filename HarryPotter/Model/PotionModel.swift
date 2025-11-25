//
//  PotionModel.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

struct PotionModel: Codable {
    let characteristics: String?
    let difficulty: String?
    let effect: String?
    let image: String?
    let inventors: String?
    let ingredients: String?
    let manufacturers: String?
    let name: String?
    let sideEffects: String?
    let slug: String?
    let time: String?
    let wiki: String?
}

struct GetPotionDataResponse: Codable {
    let id: String
    let type: String
    let attributes: PotionModel
    let links: LinksResponse
}

struct GetListOfPotionsResponse: Codable {
    let data: [GetPotionDataResponse]
    let meta: Meta
    let links: Links
}

struct GetSinglePotionResponse: Codable {
    let data: GetPotionDataResponse
    let meta: Meta
    let links: Links
}

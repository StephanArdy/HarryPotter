//
//  CharacterModel.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

struct CharacterModel: Codable {
    let aliasNames: [String]?
    let animagus: String?
    let bloodStatus: String?
    let boggart: String?
    let born: String?
    let died: String?
    let eyeColor: String?
    let familyMember: [String]?
    let gender: String?
    let hairColor: String?
    let height: String?
    let house: String?
    let image: String?
    let jobs: [String]?
    let maritalStatus: String?
    let name: String?
    let nationality: String?
    let patronus: String?
    let romances: [String]?
    let skinColor: String?
    let slug: String?
    let species: String?
    let titles: [String]?
    let wand: [String]?
    let weight: String?
    let wiki: String?
}

struct GetCharacterDataResponse: Codable, Identifiable {
    let id: String
    let type: String
    let attributes: CharacterModel
    let links: LinksResponse
}

struct GetListOfCharactersResponse: Codable {
    var data: [GetCharacterDataResponse]
    var meta: Meta
    var links: Links
}

struct GetSingleCharacterResponse: Codable {
    let data: GetCharacterDataResponse
    let meta: Meta
    let links: Links
}

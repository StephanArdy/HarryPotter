//
//  CharacterViewModel.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

@MainActor
class CharacterViewModel: ObservableObject {
    let characterService = CharacterService()
    
    @Published var characters: GetListOfCharactersResponse?
    @Published var character: GetSingleCharacterResponse?
    
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTasks() {
        tasks.forEach({ $0.cancel() })
        tasks = []
    }
    
    func loadCharacters(number: Int) async {
        print("Running loadCharacters...")
        let task = Task {
            do {
                let size = 10
                characters = try await characterService.getListOfCharacters(number: number, size: size)
                print("characters: \(String(describing: characters))")
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
    
    func loadCharacter(characterID: String) async {
        print("Running loadCharacter with character id: \(characterID)...")
        let task = Task {
            do {
                character = try await characterService.getCharacterByID(characterID: characterID)
                print("character: \(String(describing: character))")
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
}

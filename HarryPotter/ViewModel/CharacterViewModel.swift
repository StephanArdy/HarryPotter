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
    
    var characterData: GetListOfCharactersResponse?
    @Published var characters: GetListOfCharactersResponse?
    @Published var character: GetSingleCharacterResponse?
    
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTasks() {
        tasks.forEach({ $0.cancel() })
        tasks = []
    }
    
    var currentPage = 1
    var totalPages = 1
    
    func loadCharacters(isDescending: Bool) async {
        print("Running loadCharacters...")
        let task = Task {
            do {
                let size = 10
                if isDescending {
                    characterData = try await characterService.getListOfCharactersDescending(number: currentPage, size: size)
                } else {
                    characterData = try await characterService.getListOfCharacters(number: currentPage, size: size)
                }
                print("character data: \(String(describing: characterData))")
                
                if characters == nil {
                    print("no data")
                    characters = characterData
                    print("characters: \(String(describing: characters))")
                } else {
                    print("append")
                    characters?.data.append(contentsOf: characterData?.data ?? [])
                    characters?.meta = characterData!.meta
                    characters?.links = characterData!.links
                    
                    print("characters: \(String(describing: characters))")
                }
                
                print("characters: \(String(describing: characters))")
                
                totalPages = characters?.meta.pagination?.last ?? 0
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
    
    func emptyCharacters() async {
        let task = Task {
            characterData = nil
            characters = nil
            currentPage = 1
        }
        tasks.append(task)
    }
    
    func loadNextPage(isDescending: Bool) async {
        await loadCharacters(isDescending: isDescending)
    }
    
    func canLoadMore() -> Bool {
        return currentPage <= totalPages
    }
}

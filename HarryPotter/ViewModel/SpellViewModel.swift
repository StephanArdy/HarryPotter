//
//  SpellViewModel.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

@MainActor
class SpellViewModel: ObservableObject {
    let spellService = SpellService()
    
    @Published var spells: GetListOfSpellsResponse?
    @Published var spell: GetSingleSpellResponse?
    
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTasks() {
        tasks.forEach({ $0.cancel() })
        tasks = []
    }
    
    func loadSpells(number: Int) async {
        print("Running loadSpells...")
        let task = Task {
            do {
                let size = 10
                spells = try await spellService.getListOfSpells(number: number, size: size)
                print("spells: \(String(describing: spells))")
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
    
    func loadSpell(spellID: String) async {
        print("Running loadSpell with spell id: \(spellID)...")
        let task = Task {
            do {
                spell = try await spellService.getSpellByID(spellID: spellID)
                print("spell: \(String(describing: spell))")
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
}

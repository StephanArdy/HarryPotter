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
    
    var spellData: GetListOfSpellsResponse?
    @Published var spells: GetListOfSpellsResponse?
    @Published var spell: GetSingleSpellResponse?
    
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTasks() {
        tasks.forEach({ $0.cancel() })
        tasks = []
    }
    
    var currentPage = 1
    var totalPages = 1
    
    func loadSpells() async {
        print("Running loadSpells...")
        let task = Task {
            do {
                let size = 10
                spellData = try await spellService.getListOfSpells(number: currentPage, size: size)
                
                if spells == nil {
                    spells = spellData
                } else {
                    guard let spellData = spellData else { return }
                    spells?.data.append(contentsOf: spellData.data)
                    spells?.meta = spellData.meta
                    spells?.links = spellData.links
                }
                
                totalPages = spells?.meta.pagination?.last ?? 0
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
    
    func loadNextPage() async {
        await loadSpells()
    }
    
    func canLoadMore() -> Bool {
        return currentPage <= totalPages
    }
}

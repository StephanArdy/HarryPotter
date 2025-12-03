//
//  PotionViewModel.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

@MainActor
class PotionViewModel: ObservableObject {
    let potionService = PotionService()
    
    var potionData: GetListOfPotionsResponse?
    @Published var potions: GetListOfPotionsResponse?
    @Published var potion: GetSinglePotionResponse?
    
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTasks() {
        tasks.forEach({ $0.cancel() })
        tasks = []
    }
    
    var currentPage = 1
    var totalPages = 1
    
    func loadPotions() async {
        print("Running loadPotions...")
        let task = Task {
            do {
                let size = 10
                potionData = try await potionService.getListOfPotions(number: currentPage, size: size)
                
                if potions == nil {
                    potions = potionData
                } else {
                    guard let potionData = potionData else { return }
                    potions?.data.append(contentsOf: potionData.data)
                    potions?.meta = potionData.meta
                    potions?.links = potionData.links
                }
                
                totalPages = potions?.meta.pagination?.last ?? 0
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
    
    func loadPotion(potionID: String) async {
        print("Running loadPotion with potion id: \(potionID)...")
        let task = Task {
            do {
                potion = try await potionService.getPotionByID(potionID: potionID)
                print("potion: \(String(describing: potion))")
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
    
    func loadNextPage() async {
        await loadPotions()
    }
    
    func canLoadMore() -> Bool {
        return currentPage <= totalPages
    }
}

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
    
    @Published var potions: GetListOfPotionsResponse?
    @Published var potion: GetSinglePotionResponse?
    
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTasks() {
        tasks.forEach({ $0.cancel() })
        tasks = []
    }
    
    func loadPotions(number: Int) async {
        print("Running loadPotions...")
        let task = Task {
            do {
                let size = 10
                potions = try await potionService.getListOfPotions(number: number, size: size)
                print("potions: \(String(describing: potions))")
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
}

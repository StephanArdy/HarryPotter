//
//  HarryPotterApp.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import SwiftUI

@main
struct HarryPotterApp: App {
    @StateObject var bookVM = BookViewModel()
    @StateObject var characterVM = CharacterViewModel()
    @StateObject var movieVM = MovieViewModel()
    @StateObject var potionVM = PotionViewModel()
    @StateObject var spellVM = SpellViewModel()
    @StateObject var navVM = NavigationViewModel()
    @StateObject var todayVM = TodayViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(bookVM)
                .environmentObject(characterVM)
                .environmentObject(movieVM)
                .environmentObject(potionVM)
                .environmentObject(spellVM)
                .environmentObject(navVM)
                .environmentObject(todayVM)
        }
    }
}

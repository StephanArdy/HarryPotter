//
//  NavigationViewModel.swift
//  HarryPotter
//
//  Created by stephan on 01/12/25.
//

import Foundation
import SwiftUI

class NavigationViewModel: ObservableObject {
    @Published var path = NavigationPath()
    
    func goToTodayView() {
        path.append(Route.todayView)
    }
    
    func goToBookView() {
        path.append(Route.bookView)
    }
    
    func goToBookDetailView(id: String) {
        path.append(Route.bookDetailView(id: id))
    }
    
    func goToMovieView() {
        path.append(Route.movieView)
    }
    
    func goToMovieDetailView(id: String) {
        path.append(Route.movieDetailView(id: id))
    }
    
    func goToMoreView() {
        path.append(Route.moreView)
    }
    
    func goToCharacterView() {
        path.append(Route.characterView)
    }
    
    func goToCharacterDetailView(id: String) {
        path.append(Route.characterDetailView(id: id))
    }
    
    func goToSpellView() {
        path.append(Route.spellView)
    }
    
    func goToSpellDetailView(id: String) {
        path.append(Route.spellDetailView(id: id))
    }
    
    func goToPotionView() {
        path.append(Route.potionView)
    }
    
    func goToPotionDetailView(id: String) {
        path.append(Route.potionDetailView(id: id))
    }
    
    func reset() {
        path = NavigationPath()
    }
}

enum Route: Hashable {
    case todayView
    case bookView
    case bookDetailView(id: String)
    case movieView
    case movieDetailView(id: String)
    case moreView
    case characterView
    case characterDetailView(id: String)
    case spellView
    case spellDetailView(id: String)
    case potionView
    case potionDetailView(id: String)
}

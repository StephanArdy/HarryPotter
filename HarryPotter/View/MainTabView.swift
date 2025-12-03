//
//  MainTabView.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var bookVM: BookViewModel
    @EnvironmentObject var movieVM: MovieViewModel
    @EnvironmentObject var navigationVM: NavigationViewModel
    @EnvironmentObject var todayVM: TodayViewModel
    
    
    var body: some View {
        NavigationStack(path: $navigationVM.path) {
            TabView {
                Tab("Today", systemImage: "text.rectangle.page") {
                    TodayView()
                        .environmentObject(todayVM)
                }
                Tab("Book", systemImage: "book.closed") {
                    BookView()
                        .environmentObject(bookVM)
                }
                Tab("Movie", systemImage: "play.display") {
                    MovieListView()
                        .environmentObject(movieVM)
                        .environmentObject(navigationVM)
                }
                Tab("More", systemImage: "ellipsis") {
                    MoreView()
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .todayView:
                    TodayView()
                case .bookView:
                    BookView()
                case .bookDetailView(let id):
                    BookDetailView(bookID: id)
                case .movieView:
                    MovieListView()
                case .movieDetailView(let id):
                    MovieDetailView(movieID: id)
                case .moreView:
                    MoreView()
                case .characterView:
                    CharacterView()
                case .characterDetailView(let id):
                    CharacterDetailView(characterID: id)
                case .spellView:
                    SpellView()
                case .spellDetailView(let id):
                    SpellDetailView(spellID: id)
                case .potionView:
                    PotionView()
                case .potionDetailView(let id):
                    PotionDetailView(potionID: id)
                }
            }

        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(BookViewModel())
        .environmentObject(MovieViewModel())
        .environmentObject(NavigationViewModel())
        .environmentObject(TodayViewModel())
}

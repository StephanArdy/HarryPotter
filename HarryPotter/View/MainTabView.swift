//
//  MainTabView.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab("Today", systemImage: "text.rectangle.page") {
                TodayView()
            }
            Tab("Book", systemImage: "book.closed") {
                BookView()
            }
            Tab("Movie", systemImage: "play.display") {
                MovieListView()
            }
            Tab("More", systemImage: "ellipsis") {
                MoreView()
            }
        }
    }
}

#Preview {
    MainTabView()
}

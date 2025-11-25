//
//  MovieListView.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var viewModel = MovieViewModel()
    
    var body: some View {
        
        Text("Movies")
            .font(.title)
        
        List(
            viewModel.movies?.data ?? []
        ) { data in
            HStack(
                spacing: 15
            ) {
                
                AsyncImage(
                    url: URL(
                        string: data.attributes.poster
                    ),
                    scale: 1,
                    content: { image in
                        image
                            .resizable()
                    },
                    placeholder: {
                        Color.gray
                    })
                .frame(
                    width: .infinity,
                    height: 256
                )
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 16
                    )
                )
                .padding(8)
                
                VStack(alignment: .leading) {
                    Text("Title: \(data.attributes.title)")
                    Text("Release: \(data.attributes.releaseDate)")
                    Text("Duration: \(data.attributes.runningTime)")
                }
            }
            
        }
        .listStyle(
            .automatic
        )
        .task {
            await viewModel
                .loadMovies()
        }
    }
}

#Preview {
    MovieListView()
}

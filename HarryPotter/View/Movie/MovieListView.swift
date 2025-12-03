//
//  MovieListView.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import SwiftUI

struct MovieListView: View {
    @EnvironmentObject var viewModel: MovieViewModel
    @EnvironmentObject var navVM: NavigationViewModel
    
    var body: some View {
        Text("Movies")
            .font(.title2)
            .padding(.bottom, 15)
        
            List(
                viewModel.movies?.data ?? []
            ) { data in
                
                HStack(
                    spacing: 15
                ) {
                    AsyncImage(
                        url: URL(
                            string: data.attributes.poster ?? ""
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
                        width: 150,
                        height: 256
                    )
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 16
                        )
                    )
                    .padding(8)
                    
                    VStack(alignment: .leading) {
                        Text("\(data.attributes.title ?? "")")
                            .font(.headline)
                        Text("\(data.attributes.releaseDate ?? "")")
                            .font(.subheadline)
                        Text("\(data.attributes.runningTime ?? "")")
                            .font(.subheadline)
                    }
                }
                .onTapGesture {
                    navVM.goToMovieDetailView(id: data.id)
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
        .environmentObject(MovieViewModel())
        .environmentObject(NavigationViewModel())
}

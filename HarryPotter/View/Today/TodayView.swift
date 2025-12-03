//
//  TodayView.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import SwiftUI

struct TodayView: View {
    @EnvironmentObject var viewModel: TodayViewModel
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Today's Recommendation")
                .font(.title2)
                .padding(.bottom, 15)
            
            Text("Movie Recommendation")
                .font(.headline)
            
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(viewModel.movies?.data ?? []) { movie in
                        VStack {
                            
                            AsyncImage(
                                url: URL(
                                    string: movie.attributes.poster ?? ""
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
                                width: 100,
                                height: 150
                            )
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 16
                                )
                            )
                            
                            Text("\(movie.attributes.title ?? "")")
                                .frame(width: 100)
                                .lineLimit(2)
                                .allowsTightening(true)
                                .minimumScaleFactor(0.5)
                                .truncationMode(.tail)
                            
                        }
                    }
                           
                    
                }
                
            }
            
            Text("Book Recommendation")
                .font(.headline)
            
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(viewModel.books?.data ?? []) { book in
                        VStack {
                            
                            AsyncImage(
                                url: URL(
                                    string: book.attributes.cover
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
                                width: 100,
                                height: 150
                            )
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 16
                                )
                            )
                            
                            Text("\(book.attributes.title)")
                                .frame(width: 100)
                                .lineLimit(2)
                                .allowsTightening(true)
                                .minimumScaleFactor(0.5)
                                .truncationMode(.tail)
                            
                        }
                    }
                           
                    
                }
                
            }
            
            Spacer()
            
        }
        .padding()
        .task {
            await viewModel.loadBooks()
            await viewModel.loadMovies()
        }
        
    }
}

#Preview {
    TodayView()
        .environmentObject(TodayViewModel())
}

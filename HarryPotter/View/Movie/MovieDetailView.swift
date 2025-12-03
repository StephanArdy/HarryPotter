//
//  MovieDetailView.swift
//  HarryPotter
//
//  Created by stephan on 01/12/25.
//

import SwiftUI
import AVKit

struct MovieDetailView: View {
    @EnvironmentObject var viewModel: MovieViewModel
//    @State private var player = AVPlayer()
    
    let movieID: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("\(viewModel.movie?.data.attributes.title ?? "Title")")
                    .font(.title)
                    .fontWeight(.bold)
                
                AsyncImage(
                    url: URL(
                        string: viewModel.movie?.data.attributes.poster ?? ""
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
                    width: 200,
                    height: 300
                )
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 16
                    )
                )
                
                HStack {
                    Text("\(viewModel.movie?.data.attributes.releaseDate ?? "1999-12-12")")
                        .font(.subheadline)
                    Text("•")
                        .font(.subheadline)
                    Text("\(viewModel.movie?.data.attributes.runningTime ?? "1h")")
                        .font(.subheadline)
                }
                .padding(.vertical, 5)
                
                
                Text("Summary")
                    .font(.headline)
                    .padding(.bottom, 3)
                
                Text("\(viewModel.movie?.data.attributes.summary ?? "")")
                    .font(.subheadline)
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Directors")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    VStack(alignment: .leading) {
                        ForEach(
                            (viewModel.movie?.data.attributes.directors ?? []), id: \.self) { data in
                                Text("\(data)")
                                    .font(.subheadline)
                            }
                    }
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Cinematographers")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    VStack(alignment: .leading) {
                        ForEach(
                            (viewModel.movie?.data.attributes.cinematographers ?? []), id: \.self) { data in
                                Text("\(data)")
                                    .font(.subheadline)
                            }
                    }
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Editors")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    VStack(alignment: .leading) {
                        ForEach(
                            (viewModel.movie?.data.attributes.editors ?? []), id: \.self) { data in
                                Text("\(data)")
                                    .font(.subheadline)
                            }
                    }
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Composers")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    VStack(alignment: .leading) {
                        ForEach(
                            (viewModel.movie?.data.attributes.musicComposers ?? []), id: \.self) { data in
                                Text("\(data)")
                                    .font(.subheadline)
                            }
                    }
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Producers")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    VStack(alignment: .leading) {
                        ForEach(
                            (viewModel.movie?.data.attributes.producers ?? []), id: \.self) { data in
                                Text("\(data)")
                                    .font(.subheadline)
                            }
                    }
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Screenwriters")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    VStack(alignment: .leading) {
                        ForEach(
                            (viewModel.movie?.data.attributes.screenwriters ?? []), id: \.self) { data in
                                Text("\(data)")
                                    .font(.subheadline)
                            }
                    }
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Distributors")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    VStack(alignment: .leading) {
                        ForEach(
                            (viewModel.movie?.data.attributes.distributors ?? []), id: \.self) { data in
                                Text("\(data)")
                                    .font(.subheadline)
                            }
                    }
                }
                
                Divider()
                
                
//                VideoPlayer(player: player)
//                    .navigationBarBackButtonHidden()
//                    .onTapGesture {
//                        let url = URL(string: viewModel.movie?.data.attributes.trailer ?? "")
//                        guard let videoLink = url else { return }
//                        player = AVPlayer(url: videoLink)
//                        player.play()
//                    }
//                    .onDisappear {
//                        player.pause()
//                    }
                
                
            }
            .padding()
        }
        .task {
            await viewModel.loadMovie(movieID: movieID)
        }
        
    }
}

#Preview {
    MovieDetailView(movieID: "406c41c1-babd-4ead-9567-9783c1742d39")
        .environmentObject(MovieViewModel())
}

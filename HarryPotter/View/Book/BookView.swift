//
//  BookView.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import SwiftUI

struct BookView: View {
    @EnvironmentObject var viewModel: BookViewModel
    @EnvironmentObject var navVM: NavigationViewModel
    
    var body: some View {
        
        Text("Books")
            .font(.title2)
            .padding(.bottom, 15)
        
        List(
            viewModel.books?.data ?? []
        ) { data in
            HStack(
                spacing: 15
            ) {
                
                AsyncImage(
                    url: URL(
                        string: data.attributes.cover
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
                    Text("Author: \(data.attributes.author)")
                }
            }
            .onTapGesture {
                navVM.goToBookDetailView(id: data.id)
            }
            
        }
        .listStyle(
            .automatic
        )
        .task {
            await viewModel
                .loadBooks()
        }
    }
}

#Preview {
    BookView()
        .environmentObject(BookViewModel())
        .environmentObject(NavigationViewModel())
}

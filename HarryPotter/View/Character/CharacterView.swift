//
//  CharacterView.swift
//  HarryPotter
//
//  Created by stephan on 02/12/25.
//

import SwiftUI

struct CharacterView: View {
    @EnvironmentObject var viewModel: CharacterViewModel
    
    @State var isDescending: Bool = false
    
    var body: some View {
            Button("sort") {
                print("sort button tapped!")
                isDescending.toggle()
            }
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.characters?.data ?? []) { character in
                        VStack {
                            HStack {
                                AsyncImage(
                                    url: URL(
                                        string: character.attributes.image ?? ""
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
                                    height: 100
                                )
                                .clipShape(
                                    RoundedRectangle(
                                        cornerRadius: 25
                                    )
                                )
                                
                                Text("\(character.attributes.name ?? "")")
                                    .lineLimit(2)
                                    .allowsTightening(true)
                                    .minimumScaleFactor(0.3)
                                    .truncationMode(.tail)
                                
                                Spacer()
                                
                            }
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.1)
                        }
                    }
                    
                }
                .scrollTargetLayout()
            }
            .task(id: viewModel.currentPage) {
                await viewModel.loadCharacters(isDescending: isDescending)
            }
            .navigationTitle("Pages \(viewModel.currentPage)")
            .onScrollTargetVisibilityChange(idType: GetCharacterDataResponse.ID.self, threshold: 0.7) { charID in
                if let lastCharacter = viewModel.characters?.data.last, charID.contains(where: {
                    $0 == lastCharacter.id
                }) {
                    if viewModel.canLoadMore() {
                        viewModel.currentPage += 1
                        Task {
                            await viewModel.loadNextPage(isDescending: isDescending)
                        }
                    }
                }
            }
            .onChange(of: isDescending) {
                Task {
                    await viewModel.emptyCharacters()
                    await viewModel.loadCharacters(isDescending: isDescending)
                }
            }
    }
}

#Preview {
    CharacterView()
        .environmentObject(CharacterViewModel())
}

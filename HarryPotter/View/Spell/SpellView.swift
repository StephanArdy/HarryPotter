//
//  SpellView.swift
//  HarryPotter
//
//  Created by stephan on 02/12/25.
//

import SwiftUI

struct SpellView: View {
    @EnvironmentObject var viewModel: SpellViewModel
    
    var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.spells?.data ?? []) { spell in
                        VStack {
                            HStack {
                                AsyncImage(
                                    url: URL(
                                        string: spell.attributes.image ?? ""
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
                                
                                Text("\(spell.attributes.name ?? "")")
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
                await viewModel.loadSpells()
            }
            .navigationTitle("Pages \(viewModel.currentPage)")
            .onScrollTargetVisibilityChange(idType: GetCharacterDataResponse.ID.self, threshold: 0.7) { charID in
                if let lastSpell = viewModel.spells?.data.last, charID.contains(where: {
                    $0 == lastSpell.id
                }) {
                    if viewModel.canLoadMore() {
                        viewModel.currentPage += 1
                        Task {
                            await viewModel.loadNextPage()
                        }
                    }
                }
            }
    }
}

#Preview {
    SpellView()
        .environmentObject(SpellViewModel())
}

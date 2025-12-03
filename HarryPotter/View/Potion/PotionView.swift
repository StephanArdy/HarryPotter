//
//  PotionView.swift
//  HarryPotter
//
//  Created by stephan on 02/12/25.
//

import SwiftUI

struct PotionView: View {
    @EnvironmentObject var viewModel: PotionViewModel
    @EnvironmentObject var navVM: NavigationViewModel
    
    var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.potions?.data ?? []) { potion in
                        VStack {
                            HStack {
                                AsyncImage(url: URL(string: potion.attributes.image ?? ""), scale: 1, content: { image in
                                    image
                                    .resizable()}, placeholder: {
                                        Color.gray
                                    })
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                
                                Text("\(potion.attributes.name ?? "")")
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
                await viewModel.loadPotions()
            }
            .navigationTitle("Pages \(viewModel.currentPage)")
            .onScrollTargetVisibilityChange(idType: GetPotionDataResponse.ID.self, threshold: 0.7) { potID in
                if let lastPotion = viewModel.potions?.data.last, potID.contains(where: { $0 == lastPotion.id}) {
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
    PotionView()
        .environmentObject(PotionViewModel())
        .environmentObject(NavigationViewModel())
}

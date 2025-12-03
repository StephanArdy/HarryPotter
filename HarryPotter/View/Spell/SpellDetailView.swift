//
//  SpellDetailView.swift
//  HarryPotter
//
//  Created by stephan on 02/12/25.
//

import SwiftUI

struct SpellDetailView: View {
    @EnvironmentObject var viewModel: SpellViewModel
    
    let spellID: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("\(viewModel.spell?.data.attributes.name ?? "Name")")
                    .font(.title)
                    .bold()
                
                AsyncImage(
                    url: URL(
                        string: viewModel.spell?.data.attributes.image ?? ""
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
                .padding(.vertical, 15)
                
                HStack(alignment: .top) {
                    Text("Category")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.spell?.data.attributes.category ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Creator")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.spell?.data.attributes.creator ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Effect")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.spell?.data.attributes.effect ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Hand")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.spell?.data.attributes.hand ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Incantation")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.spell?.data.attributes.incantation ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Light")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.spell?.data.attributes.light ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
            }
            .padding()
        }
        .task {
            await viewModel.loadSpell(spellID: spellID)
        }
    }
}

#Preview {
    SpellDetailView(spellID: "317623dc-33c9-4876-957d-07d793fb689a")
        .environmentObject(SpellViewModel())
}

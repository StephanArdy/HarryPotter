//
//  PotionDetailView.swift
//  HarryPotter
//
//  Created by stephan on 02/12/25.
//

import SwiftUI

struct PotionDetailView: View {
    @EnvironmentObject var viewModel: PotionViewModel
    
    let potionID: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("\(viewModel.potion?.data.attributes.name ?? "Name")")
                    .font(.title)
                    .bold()
                
                
                AsyncImage(
                    url: URL(
                        string: viewModel.potion?.data.attributes.image ?? ""
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
                    Text("Characteristics")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.potion?.data.attributes.characteristics ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Difficulty")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.potion?.data.attributes.difficulty ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Effect")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.potion?.data.attributes.effect ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Inventors")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.potion?.data.attributes.inventors ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Ingridients")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.potion?.data.attributes.ingredients ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Manufacturers")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.potion?.data.attributes.manufacturers ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Side Effects")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.potion?.data.attributes.sideEffects ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Time")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.potion?.data.attributes.time ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                
            }
            .padding()
        }
        .task {
            await viewModel.loadPotion(potionID: potionID)
        }
    }
}

#Preview {
    PotionDetailView(potionID: "ec479a3f-a76f-46e0-ba9c-eb0004b8c73c")
        .environmentObject(PotionViewModel())
}

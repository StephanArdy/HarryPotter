//
//  CharacterDetailView.swift
//  HarryPotter
//
//  Created by stephan on 02/12/25.
//

import SwiftUI

struct CharacterDetailView: View {
    @EnvironmentObject var viewModel: CharacterViewModel
    
    let characterID: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("\(viewModel.character?.data.attributes.name ?? "Name")")
                    .font(.title)
                    .bold()
                
                
                AsyncImage(
                    url: URL(
                        string: viewModel.character?.data.attributes.image ?? ""
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
                    Text("Alias name")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    VStack(alignment: .leading) {
                        ForEach(
                            (viewModel.character?.data.attributes.aliasNames ?? ["-"]), id: \.self) { data in
                                Text("\(data)")
                                    .font(.subheadline)
                            }
                    }
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Animagus")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.character?.data.attributes.animagus ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Blood Status")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.character?.data.attributes.bloodStatus ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Boggart")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.character?.data.attributes.boggart ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Born")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.character?.data.attributes.born ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Died")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.character?.data.attributes.died ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Eye Color")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.character?.data.attributes.eyeColor ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Family Member")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    VStack(alignment: .leading) {
                        ForEach(
                            (viewModel.character?.data.attributes.familyMember ?? ["-"]), id: \.self) { data in
                                Text("\(data)")
                                    .font(.subheadline)
                            }
                    }
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Gender")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.character?.data.attributes.gender ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Hair Color")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.character?.data.attributes.hairColor ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Height")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.character?.data.attributes.height ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("House")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.character?.data.attributes.house ?? "-")")
                        .font(.subheadline)
                }
                
                HStack(alignment: .top) {
                    Text("Jobs")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    VStack(alignment: .leading) {
                        ForEach(
                            (viewModel.character?.data.attributes.jobs ?? []), id: \.self) { data in
                                Text("\(data)")
                                    .font(.subheadline)
                            }
                    }
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Marital Status")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.character?.data.attributes.maritalStatus ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Nationality")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.character?.data.attributes.nationality ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Patronus")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.character?.data.attributes.patronus ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Romances")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    VStack(alignment: .leading) {
                        ForEach(
                            (viewModel.character?.data.attributes.romances ?? ["-"]), id: \.self) { data in
                                Text("\(data)")
                                    .font(.subheadline)
                            }
                    }
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Skin Color")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.character?.data.attributes.skinColor ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Species")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.character?.data.attributes.species ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Titles")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    VStack(alignment: .leading) {
                        ForEach(
                            (viewModel.character?.data.attributes.titles ?? ["-"]), id: \.self) { data in
                                Text("\(data)")
                                    .font(.subheadline)
                            }
                    }
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Wands")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    VStack(alignment: .leading) {
                        ForEach(
                            (viewModel.character?.data.attributes.wand ?? ["-"]), id: \.self) { data in
                                Text("\(data)")
                                    .font(.subheadline)
                            }
                    }
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Weight")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.character?.data.attributes.weight ?? "-")")
                        .font(.subheadline)
                }
                
                Divider()
                
                
            }
            .padding()
        }
        .task {
            await viewModel.loadCharacter(characterID: characterID)
        }
    }
}

#Preview {
    CharacterDetailView(characterID: "db55dcdb-f5c8-4236-bd61-f3bb8768c0ef")
        .environmentObject(CharacterViewModel())
}

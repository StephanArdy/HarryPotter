//
//  MoreView.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import SwiftUI

struct MoreView: View {
    @EnvironmentObject var characterVM: CharacterViewModel
    @EnvironmentObject var PotionVM: PotionViewModel
    @EnvironmentObject var SpellVM: SpellViewModel
    @EnvironmentObject var navVM: NavigationViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("More")
                .font(.title2)
                .padding(.bottom, 15)
            
            HStack {
                Text("Characters")
                Spacer()
                Image(systemName: "arrow.right")
            }
            .onTapGesture {
                navVM.goToCharacterView()
            }
            
            ScrollView(.horizontal) {
                HStack (alignment: .top, spacing: 10) {
                    ForEach(
                        characterVM.characters?.data ?? []
                    ) { character in
                        
                        VStack(alignment: .leading) {
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
                                height: 150
                            )
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 16
                                )
                            )
                            
                            Text("\(character.attributes.name ?? "")")
                                .frame(width: 100)
                        }
                        .onTapGesture {
                            navVM.goToCharacterDetailView(id: character.id)
                        }
                    }
                }
            }
            
            HStack {
                Text("Spells")
                Spacer()
                Image(systemName: "arrow.right")
            }
            .onTapGesture {
                navVM.goToSpellView()
            }
            
            ScrollView(.horizontal) {
                HStack (alignment: .top, spacing: 10) {
                    ForEach(
                        SpellVM.spells?.data ?? []
                    ) { spell in
                        
                        VStack(alignment: .leading) {
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
                                height: 150
                            )
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 16
                                )
                            )
                            
                            Text("\(spell.attributes.name ?? "")")
                                .frame(width: 100)
                        }
                        .onTapGesture {
                            navVM.goToSpellDetailView(id: spell.id)
                        }
                    }
                }
            }
            
            
            HStack {
                Text("Potions")
                Spacer()
                Image(systemName: "arrow.right")
            }
            .onTapGesture {
                navVM.goToPotionView()
            }
            
            ScrollView(.horizontal) {
                HStack (alignment: .top, spacing: 10) {
                    ForEach(
                        PotionVM.potions?.data ?? []
                    ) { potion in
                        
                        VStack(alignment: .leading) {
                            AsyncImage(
                                url: URL(
                                    string: potion.attributes.image ?? ""
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
                            
                            Text("\(potion.attributes.name ?? "")")
                                .frame(width: 100)
                        }
                        .onTapGesture {
                            navVM.goToPotionDetailView(id: potion.id)
                        }
                    }
                }
            }
            
            
        }
        .padding()
        .task {
            await characterVM.loadCharacters(isDescending: false)
            await
            SpellVM.loadSpells()
            await PotionVM.loadPotions()
        }
    }
}

#Preview {
    MoreView()
        .environmentObject(CharacterViewModel())
        .environmentObject(PotionViewModel())
        .environmentObject(SpellViewModel())
}

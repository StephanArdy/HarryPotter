//
//  ContentView.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var bookVM = BookViewModel()
    @StateObject var movieVM = MovieViewModel()
    @StateObject var spellVM = SpellViewModel()
    @StateObject var characterVM = CharacterViewModel()
    @StateObject var potionVM = PotionViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Book")
            
            Button("Get Books", action: {
                Task {
                    print("Trigger GetBooks Button")
                    await bookVM.loadBooks()
                }
            })
            
            Button("Get Harry Potter and the Philosopher's Stone Book", action: {
                Task {
                    print("Trigger Get Single Book Button")
                    await bookVM.loadBook(bookID: "76040954-a2ea-45bc-a058-6d2d9f6d71ea")
                }
            })
            
            Button("Get Chapters of Harry Potter and the Philosopher's Stone Book", action: {
                Task {
                    print("Trigger Get Chapter")
                    await bookVM.loadChapters(bookID: "76040954-a2ea-45bc-a058-6d2d9f6d71ea")
                }
            })
            
            Button("Get Chapter 1 of Harry Potter and the Philosopher's Stone Book", action: {
                Task {
                    print("Trigger Single Chapter")
                    await bookVM.loadChapter(bookID: "76040954-a2ea-45bc-a058-6d2d9f6d71ea", chapterID: "f6e40385-7dd0-42e1-9d80-a0ac70710734")
                }
            })
            
            Text("Movie")
            
            Button("Get Movies", action: {
                Task {
                    print("Trigger Get Movies")
                    await movieVM.loadMovies()
                }
                
            })
            
            Button("Get Harry Potter and the Philosopher's Stone Movie", action: {
                Task {
                    print("Trigger Get Single Movie")
                    await movieVM.loadMovie(movieID: "406c41c1-babd-4ead-9567-9783c1742d39")
                }
                
            })
            
            Text("Spell")
            
            Button("Get Spell Page 1", action: {
                Task {
                    print("Trigger Get Spell Page 1")
                    await spellVM.loadSpells(number: 1)
                }
                
            })
            
            Button("Get Spell Page 2", action: {
                Task {
                    print("Trigger Get Spell Page 2")
                    await spellVM.loadSpells(number: 2)
                }
                
            })
            
            Button("Get Age Line", action: {
                Task {
                    print("Trigger Get Single Movie")
                    await spellVM.loadSpell(spellID: "317623dc-33c9-4876-957d-07d793fb689a")
                }
            })
            
            Text("Character")
            
            Button("Get Character Page 1", action: {
                Task {
                    print("Trigger Get Spell Page 1")
                    await characterVM.loadCharacters(number: 1)
                }
                
            })
            
            Button("Get Character Page 2", action: {
                Task {
                    print("Trigger Get Spell Page 2")
                    await characterVM.loadCharacters(number: 2)
                }
                
            })
            
            Button("Get Black Guy", action: {
                Task {
                    print("Trigger Get Single Character")
                    await characterVM.loadCharacter(characterID: "db55dcdb-f5c8-4236-bd61-f3bb8768c0ef")
                }
            })
            
            Text("Potion")
            
            Button("Get Potion Page 1", action: {
                Task {
                    print("Trigger Get Potion Page 1")
                    await potionVM.loadPotions(number: 1)
                }
                
            })
            
            Button("Get Potion Page 2", action: {
                Task {
                    print("Trigger Get Potion Page 2")
                    await potionVM.loadPotions(number: 2)
                }
                
            })
            
            Button("Get Ageing Potion", action: {
                Task {
                    print("Trigger Get Single Potion")
                    await potionVM.loadPotion(potionID: "ec479a3f-a76f-46e0-ba9c-eb0004b8c73c")
                }
            })
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

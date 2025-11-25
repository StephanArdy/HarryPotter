//
//  BookDetailView.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import SwiftUI

struct BookDetailView: View {
    let bookData: BookModel
    
    var body: some View {
        ScrollView {
            
            Text("\(bookData.title)")
                .font(.title)
                .bold()
            
            
            AsyncImage(
                url: URL(
                    string: bookData.cover
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
                height: 500
            )
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 16
                )
            )
            .padding(8)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Summary")
                    .font(.headline)
                Text("\(bookData.summary)")
                
                Text("Author")
                    .font(.headline)
                Text("\(bookData.author)")
                
                Text("Release Date")
                    .font(.headline)
                Text("\(bookData.releaseDate)")
                
                Text("Total Page")
                    .font(.headline)
                Text("\(bookData.pages)")
                
                Text("Dedication")
                    .font(.headline)
                Text("\(bookData.dedication)")
                
                Link("Wiki", destination: URL(string: "\(bookData.wiki)")!)
            }
            .padding(.horizontal, 15)
            
        }
    }
}

#Preview {
    BookDetailView(
        bookData: BookModel(
            author: "J. K. Rowling",
            cover: "https://www.wizardingworld.com/images/products/books/UK/rectangle-1.jpg",
            dedication: "For Jessica, who loves stories, for Anne, who loved them too, and for Di, who heard this one first",
            pages: 233,
            releaseDate: "1997-06-26",
            summary: "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!",
            slug: "harry-potter-and-the-philosopher-s-stone",
            title: "Harry Potter and the Philosopher's Stone",
            wiki: "https://harrypotter.fandom.com/wiki/Harry_Potter_and_the_Philosopher's_Stone"
        )
    )
}

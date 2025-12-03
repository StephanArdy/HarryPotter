//
//  BookDetailView.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import SwiftUI

struct BookDetailView: View {
    @EnvironmentObject var viewModel: BookViewModel
    
    let bookID: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("\(viewModel.book?.data.attributes.title ?? "Title")")
                    .font(.title)
                    .bold()
                
                
                AsyncImage(
                    url: URL(
                        string: viewModel.book?.data.attributes.cover ?? ""
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
                
                
                
                Text("Summary")
                    .font(.headline)
                    .padding(.top, 5)
                    .padding(.bottom, 3)
                Text("\(viewModel.book?.data.attributes.summary ?? "")")
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Author")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.book?.data.attributes.author ?? "")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Release Date")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.book?.data.attributes.releaseDate ?? "")")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Total Page")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.book?.data.attributes.pages ?? 0)")
                        .font(.subheadline)
                }
                
                Divider()
                
                HStack(alignment: .top) {
                    Text("Dedication")
                        .font(.headline)
                        .frame(width: 150, alignment: .leading)
                    
                    Spacer()
                        .frame(width: 15)
                    
                    
                    Text("\(viewModel.book?.data.attributes.dedication ?? "")")
                        .font(.subheadline)
                }
                
//                Divider()
//                
//                HStack(alignment: .top) {
//                    Text("Wiki")
//                        .font(.headline)
//                        .frame(width: 150, alignment: .leading)
//                    
//                    Spacer()
//                        .frame(width: 15)
//                    
//                    
//                    Link("Wiki", destination: URL(string: "\(viewModel.book?.data.attributes.wiki ?? "")")!)
//                }
                
                Divider()
                
                Text("Chapters")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                VStack(alignment: .leading) {
                    ForEach(viewModel.chapters?.data ?? []) { data in
                        
                        VStack(alignment: .leading) {
                            HStack (alignment: .center){
                                Text("Chapter \(data.attributes.order):")
                                    .font(.subheadline)
                                    .frame(width: 100, alignment: .leading)
                                
                                Spacer()
                                    .frame(width: 15)
                                
                                Text("\(data.attributes.title)")
                                    .font(.subheadline)
                                    .frame(width: 200, alignment: .leading)
                            }
                            .padding(.bottom, 3)
                            
                            Text("\(data.attributes.summary)")
                        }
                        
                        
                        Divider()
                        
                    }
                }
            }
            .padding()
            
            
        }
        .task {
            await viewModel.loadBook(bookID: bookID)
            await viewModel.loadChapters(bookID: bookID)
        }
    }
}

#Preview {
    BookDetailView(
        //        bookData: BookModel(
        //            author: "J. K. Rowling",
        //            cover: "https://www.wizardingworld.com/images/products/books/UK/rectangle-1.jpg",
        //            dedication: "For Jessica, who loves stories, for Anne, who loved them too, and for Di, who heard this one first",
        //            pages: 233,
        //            releaseDate: "1997-06-26",
        //            summary: "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!",
        //            slug: "harry-potter-and-the-philosopher-s-stone",
        //            title: "Harry Potter and the Philosopher's Stone",
        //            wiki: "https://harrypotter.fandom.com/wiki/Harry_Potter_and_the_Philosopher's_Stone"
        //        )
        bookID: "76040954-a2ea-45bc-a058-6d2d9f6d71ea")
    .environmentObject(BookViewModel())
}

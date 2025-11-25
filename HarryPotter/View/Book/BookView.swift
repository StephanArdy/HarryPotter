////
////  BookView.swift
////  HarryPotter
////
////  Created by stephan on 25/11/25.
////
//
//import SwiftUI
//
//struct BookView: View {
//    @StateObject var viewModel = BookViewModel()
//    
//    var body: some View {
//        
//        List(viewModel.books?.data ?? []) { item in
//            HStack {
//                Image(item.attributes.cover)
//                
//                VStack {
//                    Text(item.attributes.title)
//                    Text(viewModel.convertDateToString(date: item.attributes.releaseDate))
//                    Text(item.attributes.author)
//                }
//            }
//            
//        }
//        .listStyle(.sidebar)
//        .task {
//            await viewModel.loadBooks()
//        }
//    }
//}
//
//#Preview {
//    BookView()
//}

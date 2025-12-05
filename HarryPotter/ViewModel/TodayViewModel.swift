//
//  TodayViewModel.swift
//  HarryPotter
//
//  Created by stephan on 02/12/25.
//

import Foundation

@MainActor
class TodayViewModel: ObservableObject {
    let movieService = MovieService()
    let bookService = BookService()
    
    @Published var movies: GetListOfMoviesResponse?
    @Published var books: GetListOfBooksResponse?
    
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTasks() {
        tasks.forEach({ $0.cancel() })
        tasks = []
    }
    
    func loadBooks() async {
        print("Running loadBooks...")
        let task = Task {
            do {
                books = try await bookService.getRandomBook()
                print("books: \(String(describing: books))")
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
    
    func loadMovies() async {
        print("Running loadMovies...")
        let task = Task {
            do {
                movies = try await movieService.getRandomMovie()
                print("movies: \(String(describing: movies))")
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
    
    func randomInt(max: Int) -> Int {
        return Int.random(in: 0..<max)
    }
}
 

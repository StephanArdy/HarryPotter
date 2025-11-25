//
//  MovieViewModel.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

@MainActor
class MovieViewModel: ObservableObject {
    let movieService = MovieService()
    
    @Published var movies: GetListOfMoviesResponse?
    @Published var movie: GetSingleMovieResponse?
    
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTasks() {
        tasks.forEach({ $0.cancel() })
        tasks = []
    }
    
    func loadMovies() async {
        print("Running loadBooks...")
        let task = Task {
            do {
                movies = try await movieService.getListOfMovies()
                print("movies: \(String(describing: movies))")
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
    
    func loadMovie(movieID: String) async {
        print("Running loadBook with movie id: \(movieID)...")
        let task = Task {
            do {
                movie = try await movieService.getMovieByID(movieID: movieID)
                print("movie: \(String(describing: movie))")
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
}

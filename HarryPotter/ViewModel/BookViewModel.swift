//
//  BookViewModel.swift
//  HarryPotter
//
//  Created by stephan on 25/11/25.
//

import Foundation

@MainActor
class BookViewModel: ObservableObject {
    let bookService = BookService()
    
    @Published var books: GetListOfBooksResponse?
    @Published var book: GetSingleBookResponse?
    @Published var chapters: GetListOfChaptersResponse?
    @Published var chapter: GetSingleChapterResponse?
    
    private var tasks: [Task<Void, Never>] = []
    
    func cancelTasks() {
        tasks.forEach({ $0.cancel() })
        tasks = []
    }
    
    func loadBooks() async {
        print("Running loadBooks...")
        let task = Task {
            do {
                books = try await bookService.getListOfBooks()
                print("books: \(String(describing: books))")
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
    
    func loadBook(bookID: String) async {
        print("Running loadBook with book id: \(bookID)...")
        let task = Task {
            do {
                book = try await bookService.getBookByID(bookID: bookID)
                print("book: \(String(describing: book))")
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
    
    func loadChapters(bookID: String) async {
        print("Running loadChapters of book id: \(bookID)...")
        let task = Task {
            do {
                chapters = try await bookService.getListOfChapters(bookID: bookID)
                print("chapters: \(String(describing: chapters))")
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
    
    func loadChapter(bookID: String, chapterID: String) async {
        print("Running loadChapter of book id: \(bookID) and chapter id: \(chapterID)...")
        let task = Task {
            do {
                chapter = try await bookService.getChapterOfBook(bookID: bookID, chapterID: chapterID)
                print("chapter: \(String(describing: chapter))")
            } catch {
                print(error)
            }
        }
        tasks.append(task)
    }
    
}

//
//  MovieListViewModal.swift
//  BRQiOSTest
//
//  Created by Heitor Kenji Takeo Ishihara on 04/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//

import Foundation

class MovieListViewModel {
    // MARK: - Properties
    let apiManager: APIManagerProtocol
    var movies: [Movie] = [Movie]()
    var numberOfCells: Int {
        return self.movies.count
    }
    var movieSelected: Movie?
    
    // MARK: - Closure Bindings
    var reloadTableViewClosure: (() -> ())?
    var showErrorAlert: (() -> ())?
    
    // MARK: - Inits
    init(apiManager: APIManagerProtocol = APIManager()) {
        self.apiManager = apiManager
    }
    
    // MARK: - Functions
    func fetchMovies(with title: String) {
        self.apiManager.fetchMovies(with: title) { (success, movies) in
            if success {
                self.movies = movies
                self.reloadTableViewClosure?()
            } else {
                self.movies = movies
                self.reloadTableViewClosure?()
                self.showErrorAlert?()
            }
        }
    }
    
    func getMovie(at indexPath: IndexPath) -> Movie{
        return self.movies[indexPath.row]
    }
    
    func movieSelected(at indexPath: IndexPath) {
        self.movieSelected = self.movies[indexPath.row]
    }
    
    func createMovieDetailViewModel() -> MovieDetailViewModel? {
        if let movie = self.movieSelected {
            return MovieDetailViewModel(movie: movie)
        } else {
            return nil            
        }
    }
}

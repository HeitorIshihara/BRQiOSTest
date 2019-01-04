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
    let apiManager: APIManager
    var movies: [Movie] = [Movie]()
    var numberOfCells: Int {
        return self.movies.count
    }
    
    // MARK: - Closure Bindings
    var reloadTableViewClosure: (()->())?
    
    // MARK: - Inits
    init(apiManager: APIManager = APIManager()) {
        self.apiManager = apiManager
    }
    
    // MARK: - Functions
    func fetchMovies(with title: String) {
        self.apiManager.fetchMovies(with: title) { (status, movies) in
            DispatchQueue.main.async {
                self.movies = movies
                self.reloadTableViewClosure?()
            }
        }
    }
    
    func getMovie(at indexPath: IndexPath) -> Movie{
        return self.movies[indexPath.row]
    }
    
}

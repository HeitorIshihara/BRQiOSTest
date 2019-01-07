//
//  MovieDetailViewModel.swift
//  BRQiOSTest
//
//  Created by Heitor Kenji Takeo Ishihara on 07/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//

import Foundation

class MovieDetailViewModel {
    // MARK: - Properties
    var apiManager: APIManagerProtocol
    var movie: Movie
    var movieDetail: MovieDetail?
    
    // MARK: - Closure Bindings
    var showMovieInfo: (() -> ())?
    
    // MARK: - Inits
    init(apiManager: APIManagerProtocol = APIManager(), movie: Movie) {
        self.apiManager = apiManager
        self.movie = movie
    }
    
    // MARK: - Functions
    func fetchMovieDetails() {
        self.apiManager.fetchMovieDetail(with: self.movie.id) { (success, movieDetail) in
            if success {
                self.movieDetail = movieDetail
                self.showMovieInfo?()
            }
        }
    }
}


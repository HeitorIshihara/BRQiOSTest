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
    var movie: Movie
    
    // MARK: - Closure Bindings
    var showMovieInfo: (() -> ())?
    
    // MARK: - Inits
    init(movie: Movie) {
        self.movie = movie
    }
    
    // MARK: - Functions

}


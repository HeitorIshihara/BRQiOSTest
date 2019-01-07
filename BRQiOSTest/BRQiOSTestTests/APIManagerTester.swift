//
//  APIManagerTester.swift
//  BRQiOSTestTests
//
//  Created by Heitor Kenji Takeo Ishihara on 07/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//

import Foundation
@testable import BRQiOSTest

class APIManagerTester: APIManagerProtocol {
    
//    let searchMoviesURL = "https://www.omdbapi.com/?apikey=5351c88c&s="
//    let movieDetailURL = "https://www.omdbapi.com/?apikey=5351c88c&i="
//
    func fetchMovies(with title: String, complete: @escaping ( _ success: Bool, _ movies: [Movie])->()) {
        
    }
    
    func fetchMovieDetail(with id: String, complete: @escaping ( _ success: Bool, _ movies: MovieDetail)->()) {
        
        complete(true, MovieDetail(posterImageURL: URL(string: "https")!, title: "Thor", releaseDate: "dsada", genre: "dsadsa", director: "dsadsa", actors: "dsadas"))
    }
}

//
//  Movie.swift
//  BRQiOSTest
//
//  Created by Heitor Kenji Takeo Ishihara on 04/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//

import Foundation

class MovieAPIResponse: Decodable {
    
    // MARK: - Properties
    let movies: [Movie]
    
    // MARK: - Decodable Keys
    enum MovieAPIResponseCodingKey: String, CodingKey {
        case search = "Search"
    }
    
    // MARK - Inits
    init(movies: [Movie]) {
       self.movies = movies
    }
    
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieAPIResponseCodingKey.self)
        
        let movies: [Movie] = try container.decode([Movie].self, forKey: .search)
        self.init(movies: movies)
    }
}

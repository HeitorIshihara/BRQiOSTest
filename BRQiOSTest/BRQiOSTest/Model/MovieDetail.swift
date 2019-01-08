//
//  MovieDetail.swift
//  BRQiOSTest
//
//  Created by Heitor Kenji Takeo Ishihara on 07/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//

import UIKit

class MovieDetail: Decodable, Equatable {
    // MARK: - Properties
    let posterImageURL: URL
    let title: String
    let releaseDate: String
    let genre: String
    let director: String
    let actors: String
    
    // MARK: - Decodable Keys
    enum MovieDetailCodingKey: String, CodingKey {
        case posterImageURL = "Poster"
        case title = "Title"
        case releaseDate = "Released"
        case genre = "Genre"
        case director = "Director"
        case actors = "Actors"
    }
    
    // MARK - Inits
    init(posterImageURL: URL, title: String, releaseDate: String, genre: String, director: String, actors: String) {
        self.posterImageURL = posterImageURL
        self.title = title
        self.releaseDate = releaseDate
        self.genre = genre
        self.director = director
        self.actors = actors
    }
    
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieDetailCodingKey.self)
        
        let posterImageURL = try container.decode(URL.self, forKey: .posterImageURL)
        let title: String = try container.decode(String.self, forKey: .title)
        let releaseDate: String = try container.decode(String.self, forKey: .releaseDate)
        let genre: String = try container.decode(String.self, forKey: .genre)
        let director: String = try container.decode(String.self, forKey: .director)
        let actors: String = try container.decode(String.self, forKey: .actors)

        self.init(posterImageURL: posterImageURL, title: title, releaseDate: releaseDate, genre: genre, director: director, actors: actors)
    }
    
    // MARK: - Equatable
    static func ==(lhs: MovieDetail, rhs: MovieDetail) -> Bool {        return lhs.posterImageURL == rhs.posterImageURL &&
        lhs.title == rhs.title &&
        lhs.releaseDate == rhs.releaseDate &&
        lhs.genre == rhs.genre &&
        lhs.director == rhs.director &&
        lhs.actors == rhs.actors
    }
}

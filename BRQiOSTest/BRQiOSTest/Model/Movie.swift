//
//  Movie.swift
//  BRQiOSTest
//
//  Created by Heitor Kenji Takeo Ishihara on 04/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//

import Foundation

class Movie: Decodable {
    
    // MARK: - Properties
    let id: String
    let title: String
    
    // MARK: - Decodable Keys
    enum MovieCodingKey: String, CodingKey {
        case id = "imdbID"
        case title = "Title"
    }
    
    // MARK - Inits
    init(id: String, title: String) {
        self.id = id
        self.title = title
    }
    
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieCodingKey.self)
        
        let id: String = try container.decode(String.self, forKey: .id)
        let title: String = try container.decode(String.self, forKey: .title)
        
        self.init(id: id, title: title)
    }
}

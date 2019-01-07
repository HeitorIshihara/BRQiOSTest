//
//  MovieDetailDecodeTests.swift
//  BRQiOSTestTests
//
//  Created by Heitor Kenji Takeo Ishihara on 07/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//


import XCTest
@testable import BRQiOSTest

class MovieDetailDecodeTests: XCTestCase {
    
    var path: String = String()
    var data = Data()
    let decoder = JSONDecoder()
    var movieDetail: MovieDetail?
    
    override func setUp() {
        super.setUp()
        
        do {
            path = Bundle.main.path(forResource: "MovieDetail", ofType: "json")!
            data = try! Data(contentsOf: URL(fileURLWithPath: path))
            
            movieDetail = try decoder.decode(MovieDetail.self, from: data)
        } catch {
            return
        }
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMovieDetailDecode() {
        guard let url = URL(string: "https://m.media-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg") else { return }
        
        let movieDetailMock = MovieDetail(posterImageURL: url, title: "Thor", releaseDate: "06 May 2011", genre: "Action, Adventure, Fantasy, Sci-Fi", director: "Kenneth Branagh", actors: "Chris Hemsworth, Natalie Portman, Tom Hiddleston, Anthony Hopkins")
        
        XCTAssertEqual(movieDetailMock.posterImageURL, movieDetail?.posterImageURL)
    }
}

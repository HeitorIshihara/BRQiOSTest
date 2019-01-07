//
//  BRQiOSTestTests.swift
//  BRQiOSTestTests
//
//  Created by Heitor Kenji Takeo Ishihara on 04/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//

import XCTest
@testable import BRQiOSTest

class DecodeTests: XCTestCase {
    
    var path: String = String()
    var data = Data()
    let decoder = JSONDecoder()
    var apiResponse: MovieAPIResponse?
    
    override func setUp() {
        super.setUp()

        do {
            path = Bundle.main.path(forResource: "SearchMovies", ofType: "json")!
            data = try! Data(contentsOf: URL(fileURLWithPath: path))
            
            apiResponse = try decoder.decode(MovieAPIResponse.self, from: data)
        } catch {
            return
        }
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMovieAPIResponseDecoderCount() throws {
        XCTAssertEqual(apiResponse?.movies.count, 10)
    }
    
    func testMovieAPIResponseDecoderFirst() throws {
        let firstMovie = Movie(id: "tt0800369", title: "Thor")
        if let apiResponseFirstMovie = apiResponse?.movies.first {
            XCTAssertEqual(apiResponseFirstMovie.id, firstMovie.id)
        }
    }
    
    func testMovieAPIResponseDecoderLast() throws {
        let lastMovie = Movie(id: "tt1922373", title: "Thor & Loki: Blood Brothers")
        if let apiResponseLastMovie = apiResponse?.movies.last {
            XCTAssertEqual(apiResponseLastMovie.id, lastMovie.id)
        }
    }
}

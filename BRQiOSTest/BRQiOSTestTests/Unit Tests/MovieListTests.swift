//
//  BRQiOSTestTests.swift
//  BRQiOSTestTests
//
//  Created by Heitor Kenji Takeo Ishihara on 04/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//

import XCTest
@testable import BRQiOSTest

class MovieListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearchURL() {
        let apiManager = APIManager()
        let finalURL = URL(string: "https://www.omdbapi.com/?apikey=5351c88c&s=Thor")
        
        let generatedURL = apiManager.urlGenerator(type: .searchMovie, param: "Thor")
        
        XCTAssertEqual(finalURL, generatedURL)
    }
    
    func testGetMovie() {
        let viewController: MovieListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieList") as! MovieListViewController
        viewController.viewModel.movies = [Movie(id: "t1", title: "Thor"), Movie(id: "t2", title: "Captain America"), Movie(id: "t3", title: "Iron Man")]
        
        let movie: Movie = viewController.viewModel.getMovie(at: IndexPath(row: 1, section: 0))
        
        XCTAssertEqual(Movie(id: "t2", title: "Captain America"), movie)
        
    }
    
    
}

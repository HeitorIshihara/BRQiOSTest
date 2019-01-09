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
    
    var movieListViewController: MovieListViewController!
    
    override func setUp() {
        super.setUp()
        
        self.movieListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieList") as? MovieListViewController
        self.movieListViewController?.viewModel.movies = [Movie(id: "t1", title: "Thor"), Movie(id: "t2", title: "Captain America"), Movie(id: "t3", title: "Iron Man")]
    }
    
    override func tearDown() {
        super.tearDown()
        
        self.movieListViewController = nil
    }
    
    func testSearchURL() {
        let apiManager = APIManager()
        let finalURL = URL(string: "https://www.omdbapi.com/?apikey=5351c88c&s=Thor")
        
        let generatedURL = apiManager.urlGenerator(type: .searchMovie, param: "Thor")
        
        XCTAssertEqual(finalURL, generatedURL)
    }
    
    func testGetMovie() {
        let movie: Movie = movieListViewController.viewModel.getMovie(at: IndexPath(row: 1, section: 0))
        
        XCTAssertEqual(Movie(id: "t2", title: "Captain America"), movie)
    }
    
    func testMovieSelected() {
        movieListViewController.viewModel.movieSelected(at: IndexPath(row: 1, section: 0))
        if let movieSelected: Movie = movieListViewController.viewModel.movieSelected {
            XCTAssertEqual(Movie(id: "t2", title: "Captain America"), movieSelected)
        }
        
    }
    
    
}

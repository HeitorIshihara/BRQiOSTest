//
//  BRQiOSTestTests.swift
//  BRQiOSTestTests
//
//  Created by Heitor Kenji Takeo Ishihara on 04/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//

import XCTest
@testable import BRQiOSTest

class BRQiOSTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMovieDetailScreenInformations() {
        let movieDetailViewController = MovieDetailViewController()
        let movie = Movie(id: "tt0800369", title: "Thor")
        let movieDetailViewModel = MovieDetailViewModel(apiManager: APIManagerTester(), movie: movie)
        movieDetailViewController.viewModel = movieDetailViewModel
        movieDetailViewController.initViewModel()
        movieDetailViewController.viewModel.fetchMovieDetails()
        movieDetailViewModel.showMovieInfo?()
        
        XCTAssertEqual(movieDetailViewController.title, "Thor")
        
    }
}

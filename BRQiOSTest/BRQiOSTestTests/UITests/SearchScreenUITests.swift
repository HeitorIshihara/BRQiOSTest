//
//  SearchScreenUITests.swift
//  BRQiOSTestUITests
//
//  Created by Heitor Kenji Takeo Ishihara on 08/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//

import Foundation
import FBSnapshotTestCase
@testable import BRQiOSTest

class SearchScreenUITests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        self.recordMode = false
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEmptyTableViewUI() {
        let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieList")
        
        
        FBSnapshotVerifyView(viewController.view)
    }
    
    func testFilledTableViewUI() {
        
        let viewController: MovieListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieList") as! MovieListViewController
        
        do {
            let path = Bundle.main.path(forResource: "SearchMovies", ofType: "json")!
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            
            let decoder = JSONDecoder()
            let apiResponse = try decoder.decode(MovieAPIResponse.self, from: data)
            
            viewController.viewModel.movies = apiResponse.movies
            viewController.viewModel.reloadTableViewClosure?()
        } catch {
            return
        }
        FBSnapshotVerifyView(viewController.view)
    }

}

//
//  MovieDetailScreenUITests.swift
//  BRQiOSTestTests
//
//  Created by Heitor Kenji Takeo Ishihara on 08/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//

import Foundation
import FBSnapshotTestCase
import SDWebImage
@testable import BRQiOSTest

class MovieDetailScreenUITests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        self.recordMode = false
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUI() {
        let movieDetailViewController: MovieDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetail") as! MovieDetailViewController
        movieDetailViewController.viewModel = MovieDetailViewModel(movie: Movie(id: "tt0800369", title: "Thor"))
        guard let url = URL(string: "https://m.media-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg") else { return }
        movieDetailViewController.viewModel.movieDetail = MovieDetail(posterImageURL: url, title: "Thor", releaseDate: "06 May 2011", genre: "Action, Adventure, Fantasy, Sci-Fi", director: "Kenneth Branagh", actors: "Chris Hemsworth, Natalie Portman, Tom Hiddleston, Anthony Hopkins")
//        _ = movieDetailViewController.view
        movieDetailViewController.loadViewIfNeeded()
        if let movieDetail = movieDetailViewController.viewModel.movieDetail {
            movieDetailViewController.title = movieDetail.title
            movieDetailViewController.posterImage.sd_setImage(with: movieDetail.posterImageURL, placeholderImage: UIImage(named: "unavailable-image"), options: SDWebImageOptions(), completed: nil)
            movieDetailViewController.releaseDate.text?.append(movieDetail.releaseDate)
            movieDetailViewController.genreLabel.text?.append(movieDetail.genre)
            movieDetailViewController.directorLabel.text?.append(movieDetail.director)
            movieDetailViewController.actorsLabel.text?.append(movieDetail.actors)

            movieDetailViewController.posterImage.isHidden = false
            movieDetailViewController.releaseDate.isHidden = false
            movieDetailViewController.genreLabel.isHidden = false
            movieDetailViewController.directorLabel.isHidden = false
            movieDetailViewController.actorsLabel.isHidden = false

            movieDetailViewController.setActivityIndicator(to: false)
        }

        FBSnapshotVerifyView(movieDetailViewController.view)
    }
    
}

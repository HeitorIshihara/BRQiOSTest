//
//  MovieDetailViewController.swift
//  BRQiOSTest
//
//  Created by Heitor Kenji Takeo Ishihara on 07/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailViewController: UIViewController {

    // MARK: - Outlets and Actions
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: MovieDetailViewModel!
    
    // MARK: - Life Cycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initViewModel()
        self.viewModel.fetchMovieDetails()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Functions
    func initViewModel() {
        // Show Movie Info
        self.viewModel.showMovieInfo = { [weak self]() in
            DispatchQueue.main.async {
                if let movieDetail = self?.viewModel.movieDetail {
                    self?.title = movieDetail.title
                    self?.posterImage.sd_setImage(with: movieDetail.posterImageURL, placeholderImage: UIImage(named: "unavailable-image"), options: SDWebImageOptions(), completed: nil)
                    self?.releaseDate.text?.append(movieDetail.releaseDate)
                    self?.genreLabel.text?.append(movieDetail.genre)
                    self?.directorLabel.text?.append(movieDetail.director)
                    self?.actorsLabel.text?.append(movieDetail.actors)
                    
                    self?.posterImage.isHidden = false
                    self?.releaseDate.isHidden = false
                    self?.genreLabel.isHidden = false
                    self?.directorLabel.isHidden = false
                    self?.actorsLabel.isHidden = false
                }
            }
        }
    }
}

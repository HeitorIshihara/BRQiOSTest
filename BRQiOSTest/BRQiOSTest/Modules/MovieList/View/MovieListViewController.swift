//
//  MovieListViewController.swift
//  BRQiOSTest
//
//  Created by Heitor Kenji Takeo Ishihara on 04/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    
    //MARK: - Outlets and IBActions
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var moviesTableView: UITableView!
    
    //MARK: - Properties
    lazy var viewModel: MovieListViewModel = {
        return MovieListViewModel()
    }()

    //MARK: - Life Cycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSearchBar()
        self.setupTableView()
        
        self.initViewModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Functions
    func initViewModel() {
        self.viewModel.reloadTableViewClosure = {
            DispatchQueue.main.async {
                self.moviesTableView.reloadData()
            }
        }
    }
    
    func setupSearchBar() {
        self.searchBar.delegate = self
    }
    
    func setupTableView() {
        self.moviesTableView.delegate = self
        self.moviesTableView.dataSource = self
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else {
            fatalError("Cell does not exists")
        }
        
        let movie = self.viewModel.getMovie(at: indexPath)
        cell.titleLabel.text = movie.title
        
        return cell
    }
}

extension MovieListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        if !text.isEmpty {
            self.viewModel.fetchMovies(with: text)
            self.searchBar.resignFirstResponder()
        }
    }
}

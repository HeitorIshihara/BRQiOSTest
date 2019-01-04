//
//  MovieListViewModal.swift
//  BRQiOSTest
//
//  Created by Heitor Kenji Takeo Ishihara on 04/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//

import Foundation

class MovieListViewModel {
    // MARK: - Properties
    let apiManager: APIManager

    // MARK: - Closure Bindings
    var reloadTableViewClosure: (()->())?
    
    // MARK: - Inits
    init(apiManager: APIManager = APIManager()) {
        self.apiManager = apiManager
    }
    
    // MARK: - Functions
    
}

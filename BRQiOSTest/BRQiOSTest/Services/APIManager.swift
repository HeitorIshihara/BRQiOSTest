//
//  APIService.swift
//  BRQiOSTest
//
//  Created by Heitor Kenji Takeo Ishihara on 04/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    let searchMoviesURL = "https://www.omdbapi.com/?apikey=5351c88c&s="
    
    func fetchMovies(with title: String, complete: @escaping ( _ success: Bool, _ movies: [Movie])->()) {
        Alamofire.request(searchMoviesURL + title).validate().responseData { response in
            switch response.result {
            case .success:
                if let data = response.result.value {
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        let apiResponse = try decoder.decode(MovieAPIResponse.self, from: data)
                        complete(true, apiResponse.movies)
                    } catch {
                        print(error)
                        complete(false, [])
                    }                    
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

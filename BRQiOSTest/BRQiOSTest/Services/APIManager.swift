//
//  APIService.swift
//  BRQiOSTest
//
//  Created by Heitor Kenji Takeo Ishihara on 04/01/2019.
//  Copyright © 2019 Heitor Kenji Takeo Ishihara. All rights reserved.
//

import Foundation
import Alamofire

protocol APIManagerProtocol {
    func fetchMovies(with title: String, complete: @escaping ( _ success: Bool, _ movies: [Movie])->())
    func fetchMovieDetail(with id: String, complete: @escaping ( _ success: Bool, _ movies: MovieDetail)->())
}

class APIManager: APIManagerProtocol {
    
    let searchMoviesURL = "https://www.omdbapi.com/?apikey=5351c88c&s="
    let movieDetailURL = "https://www.omdbapi.com/?apikey=5351c88c&i="
    
    func fetchMovies(with title: String, complete: @escaping ( _ success: Bool, _ movies: [Movie])->()) {
        Alamofire.request(searchMoviesURL + title).validate().responseData { response in
            switch response.result {
            case .success:
                if let data = response.result.value {
                    
                    let decoder = JSONDecoder()
                    
                    // Thats necessary because the api returns code 200 even if it fails
                    // so the Alomofire.validate() wont catch it as an error
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
    
    func fetchMovieDetail(with id: String, complete: @escaping ( _ success: Bool, _ movies: MovieDetail)->()) {
        Alamofire.request(movieDetailURL + id).validate().responseData { response in
            switch response.result {
            case .success:
                if let data = response.result.value {
                    
                    let decoder = JSONDecoder()
                    
                    // Thats necessary because the api returns code 200 even if it fails
                    // so the Alomofire.validate() wont catch it as an error
                    do {
                        let movieDetail = try decoder.decode(MovieDetail.self, from: data)
                        complete(true, movieDetail)
                    } catch {
                        print(error)
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

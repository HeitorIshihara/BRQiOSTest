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

enum URLType: String {
    case searchMovie = "s="
    case movieDetail = "i="
}

class APIManager: APIManagerProtocol {
    
    let apiURL = "https://www.omdbapi.com/?apikey=5351c88c&"

    func urlGenerator(type: URLType, param: String) -> URL? {
        let urlString: String = apiURL + type.rawValue + param
        
        if let url = URL(string: urlString) {
            return url
        } else {
            print("URL cant be empty")
            return nil
        }
    }
    
    func fetchMovies(with title: String, complete: @escaping ( _ success: Bool, _ movies: [Movie])->()) {
        guard let url = urlGenerator(type: .searchMovie, param: title) else { return }
        Alamofire.request(url).validate().responseData { response in
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
        guard let url = urlGenerator(type: .movieDetail, param: id) else { return }
        Alamofire.request(url).validate().responseData { response in
            switch response.result {
            case .success:
                if let data = response.result.value {
                    let decoder = JSONDecoder()
                    
                    // Thats necessary because the api returns code 200 even if it fails
                    // so the Alomofire.validate() wont catch it as an error
                    do {
                        let movieDetail = try decoder.decode(MovieDetail.self, from: data)
                        print(movieDetail.posterImageURL)
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

//
//  APIConstants.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 13/05/21.
//

import Foundation

struct APIConstants {
    static let BaseUrl = "https://api.themoviedb.org/3/movie/"
    static let API_KEY = "0052f66d8aabf0eeb22b70c0aaece835"
    static let ImageBaseUrl = "https://image.tmdb.org/t/p/"
    static let PopularMoviesListUrl = BaseUrl + "now_playing?&language=en-US&page=1&api_key=" + API_KEY 
}

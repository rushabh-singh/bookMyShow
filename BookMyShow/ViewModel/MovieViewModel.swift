//
//  MovieViewModel.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 13/05/21.
//

import Foundation
import UIKit

struct MovieViewModel {
    let movieName : String
    let releaseDate : String
    let voteCount : String
    let movieType : String
    let posterUrl : URL
    
    init(movie : MovieItem?) {
        self.movieName = movie?.title ?? "Movie Name NA"
        self.releaseDate = movie?.releaseDate ?? "Release Date NA"
        self.voteCount = String(movie?.voteCount ?? 0)
        if let filePath = movie?.posterPath{
            self.posterUrl = URL(string: APIConstants.ImageBaseUrl + ImageSizeConstant.smallImageSize + filePath)!
        }
        else{
            self.posterUrl = URL(string : "")!
        }
        movieType = movie?.adult ?? true ? "Only 18+ allowed" : "Family Movie"
    }
}

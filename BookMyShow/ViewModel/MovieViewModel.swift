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
    let movieId : Int
    
    init(movie : MovieItem?) {
        
        movieType = movie?.adult ?? true ? BMSConstant.adultMovieWarning : BMSConstant.familyMovieMessage
        self.movieId = movie?.id ?? 0
        self.voteCount = String(movie?.voteCount ?? 0)
        if let movieName = movie?.title{
            if movieName.isEmpty{
                self.movieName = BMSConstant.movieNameNotAvailable
            }
            else{
                self.movieName = movieName
            }
        } else{
            self.movieName = BMSConstant.movieNameNotAvailable
        }
        
        if let releaseDate = movie?.releaseDate{
            if releaseDate.isEmpty{
                self.releaseDate = BMSConstant.releaseDateNotAvailable
            }
            else{
                self.releaseDate = releaseDate
            }
        } else{
            self.releaseDate = BMSConstant.releaseDateNotAvailable
        }
        
        if let filePath = movie?.posterPath{
            self.posterUrl = URL(string: APIConstants.ImageBaseUrl + ImageSizeConstant.smallImageSize + filePath)!
        }
        else{
            self.posterUrl = URL(string : "")!
        }
    }
}

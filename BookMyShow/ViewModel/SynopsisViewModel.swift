//
//  SynopsisViewModel.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 13/05/21.
//

import Foundation
import UIKit

struct SynopsisViewModel {
    let movieName : String
    let duration : String
    let releaseDate : String
    let posterUrl : URL
    let movieId : Int
    let overview: String
    
    
    init(data : SynopsisModel?) {
        
        if data?.runtime ?? 0 > 0{
            self.duration = String(data!.runtime)
        } else{
            self.duration = BMSConstant.notAvailable
        }
        self.movieId = data?.id ?? 0
        if let filePath = data?.posterPath{
            self.posterUrl = URL(string: APIConstants.ImageBaseUrl + ImageSizeConstant.smallImageSize + filePath)!
        }
        else{
            self.posterUrl = URL(string : "")!
        }
        if let overview = data?.overview{
            if overview.isEmpty{
                self.overview = BMSConstant.overviewNotAvailable
            }
            else{
                self.overview = overview
            }
        } else{
            self.overview = BMSConstant.overviewNotAvailable
        }
        
        if let movieName = data?.title{
            if movieName.isEmpty{
                self.movieName = BMSConstant.movieNameNotAvailable
            }
            else{
                self.movieName = movieName
            }
        } else{
            self.movieName = BMSConstant.movieNameNotAvailable
        }
        
        if let releaseDate = data?.releaseDate{
            if releaseDate.isEmpty{
                self.releaseDate = BMSConstant.releaseDateNotAvailable
            }
            else{
                self.releaseDate = releaseDate
            }
        } else{
            self.releaseDate = BMSConstant.releaseDateNotAvailable
        }
    }
}

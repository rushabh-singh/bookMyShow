//
//  SynopsisModel.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 13/05/21.
//

import Foundation

struct SynopsisModel: Codable {
    let id: Int
    let overview: String
    let posterPath: String
    let releaseDate: String
    let title: String
    let runtime : Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case runtime
        case title
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}


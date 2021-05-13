//
//  PopularMoviesModel.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 13/05/21.
//

import Foundation

struct PopularMoviesModel: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let adult: Bool
    let id: Int
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

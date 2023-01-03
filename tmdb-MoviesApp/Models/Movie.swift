//
//  Movie.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 11.11.2022.
//

import Foundation

struct MovieResponse: Codable{
    let results : [Movie]
}

struct Movie: Codable {
    let backdropPath: String?
    let id: Int
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String?
    var title: String
    let voteAverage: Double
    //    let genreIDS: [Int]

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        //        case genreIDS = "genre_ids"
    }
}

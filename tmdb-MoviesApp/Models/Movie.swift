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
   var backdropPath: String?
   var id: Int
   var overview: String
   var popularity: Double
   var posterPath: String?
   var releaseDate: String?
   var title: String
   var voteAverage: Double
//var genreIDS: [Int]

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

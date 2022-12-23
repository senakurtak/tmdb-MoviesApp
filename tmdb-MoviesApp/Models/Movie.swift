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

// MARK: - Result (Movie olarak değiştirdim.)
struct Movie: Codable {
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    var title: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}

//
//import Foundation
//
//// MARK: - Result (Movie olarak değiştirdim.)
//struct Movie: Codable {
//    let backdropPath: String
//    let genreIDS: [Int]
//    let id: Int
//    let overview: String
//    let popularity: Double
//    let posterPath: String
//    let releaseDate: String
//    let title: String
//    let voteAverage: Double
//    
//    enum CodingKeys: String, CodingKey {
//        case backdropPath = "backdrop_path"
//        case genreIDS = "genre_ids"
//        case id
//        case overview
//        case popularity
//        case posterPath = "poster_path"
//        case releaseDate = "release_date"
//        case title
//        case voteAverage = "vote_average"
//    }
//}
//
//// MARK: - Temperatures
////struct Temperatures: Codable {
////    let page: Int
////    let results: [Result]
////    let totalPages, totalResults: Int
////
////    enum CodingKeys: String, CodingKey {
////        case page, results
////        case totalPages = "total_pages"
////        case totalResults = "total_results"
////    }
////}
//
//enum OriginalLanguage: String, Codable {
//    case en = "en"
//    case fr = "fr"
//    case ja = "ja"
//}
//
//// MARK: - Temperatures
//struct MovieGenre: Codable {
//    let genres: [Genre]
//}
//
//// MARK: - Genre
//struct Genre: Codable {
//    let id: Int
//    let name: String
//}

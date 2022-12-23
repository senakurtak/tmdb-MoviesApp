//
//  FavoriteMovies.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 9.12.2022.
//

struct FavoriteMovies: Codable {
    var isSaved: Bool
    let backdropPath: String?
    let genreIDS: [Int]
    let id: Int
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let voteAverage: Double
}

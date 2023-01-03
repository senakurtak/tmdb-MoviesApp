//
//  Realm.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 3.01.2023.
//

import Foundation
import RealmSwift

final class RealmHandler{
    
    let movieFavorite = FavoriteMovie()
    
    let realm = try! Realm()
    
    func fetchRealmDatas(movie: Movie){
        
        movieFavorite.title = movie.title
        movieFavorite.id = movie.id
        movieFavorite.voteAverage = movie.voteAverage
        movieFavorite.backdropPath = movie.backdropPath ?? "movie backdropPath could not find"
        movieFavorite.overview = movie.overview
        movieFavorite.posterPath = movie.posterPath ?? "movie posterPath could not find"
        movieFavorite.popularity = movie.popularity
        movieFavorite.releaseDate = movie.releaseDate ?? "movie releaseDate could not find"
        
            realm.beginWrite()
            realm.add(movieFavorite)
            try! realm.commitWrite()
    }
}

//
//  RealmService.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 11.01.2023.
//

import Foundation
import UIKit
import RealmSwift

struct RealmDataService : DataService {
    
    static let shared = RealmDataService()
    
    let realm = try! Realm()
        
    // MARK: Set Movie as favorite
    func saveLocalData(movie: Movie) {
        do{
            try realm.write {
                let favSelectedMovie = FavoriteMovie()
                favSelectedMovie.title = movie.title
                favSelectedMovie.id = movie.id
                favSelectedMovie.releaseDate = movie.releaseDate ?? "releaseDate is not exist"
                favSelectedMovie.popularity = movie.popularity
                favSelectedMovie.backdropPath = movie.backdropPath ?? "backdropPath is not exist"
                favSelectedMovie.posterPath = movie.posterPath ?? "posterPath is not exist"
                favSelectedMovie.voteAverage = movie.voteAverage
                favSelectedMovie.overview = movie.overview
                realm.add(favSelectedMovie)
            }
        }catch{
            print("error on saveFavourite function")
        }
    }
    
    // MARK: Remove Movie from favorites
    func deleteLocaleData(movie: Movie) {
        var id = movie.id
        guard let obj = self.realm.objects(FavoriteMovie.self).where({$0.id == id}).first else {return}
        do{
            realm.beginWrite()
            realm.delete(obj)
            try? realm.commitWrite()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    // MARK: Fetch Favorite Movie from saved RealmServices
    func fetchLocalData() -> [Movie]{
        self.realm.beginWrite()
        let savedMovies = self.realm.objects(FavoriteMovie.self)
        try! realm.commitWrite()
        let result = Array(savedMovies).map { item in
                Movie(backdropPath: item.backdropPath, id: item.id, overview: item.overview, popularity: item.popularity, posterPath: item.posterPath, releaseDate: item.releaseDate, title: item.title, voteAverage: item.voteAverage)
        }
        return result
    }
}

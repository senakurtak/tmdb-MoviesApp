//
//  RealmHandler.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 4.01.2023.
//
// Silinebilir hale getiriliyor.
import Foundation
import UIKit
import RealmSwift



final class RealmHandler{
    
    static let shared = RealmHandler()
    
    var savedArray = [Movie]()
    
    let realm = try! Realm()
    
    // MARK: Set Movie as favorite
    func setFavoriteMovie(selectedMovie : Movie){
        
        do{
            try realm.write {
                let favSelectedMovie = FavoriteMovie()
                favSelectedMovie.title = selectedMovie.title
                favSelectedMovie.id = selectedMovie.id
                favSelectedMovie.releaseDate = selectedMovie.releaseDate ?? "releaseDate is not exist"
                favSelectedMovie.popularity = selectedMovie.popularity
                favSelectedMovie.backdropPath = selectedMovie.backdropPath ?? "backdropPath is not exist"
                favSelectedMovie.posterPath = selectedMovie.posterPath ?? "posterPath is not exist"
                favSelectedMovie.voteAverage = selectedMovie.voteAverage
                favSelectedMovie.overview = selectedMovie.overview
                realm.add(favSelectedMovie)
                savedArray.append(selectedMovie)
            }
        }catch{
            print("error on saveFavourite function")
        }
    }
    
    // MARK: Remove Movie from favorites
    func removeFromFavorites(selectedMovie : Movie){
        var id = selectedMovie.id
        guard let obj = self.realm.objects(FavoriteMovie.self).where({$0.id == id}).first else {return}
        do{
            realm.beginWrite()
            realm.delete(obj)
            try realm.commitWrite()
            savedArray.removeAll(where: ({$0.id == id}))
        }catch{
            print(error.localizedDescription)
        }
    }
    
    // MARK: check movie exist in local DB
    func isMovieExistInFavorites(selectedMovie : Movie) -> Bool{
        var id = selectedMovie.id
        guard realm.objects(FavoriteMovie.self).where({$0.id == id}).first != nil else {return false}
        return true
    }
}

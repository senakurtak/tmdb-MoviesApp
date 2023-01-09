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
        fetchLocalData()
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
      fetchLocalData()
    }
    
    // MARK: fetch saved movies
    
    //    func fetchLocalFavorites(){
    //        self.realm.beginWrite()
    //        let savedMovies = self.realm.objects(FavoriteMovie.self)
    //        self.savedArray.removeAll()
    //        try! self.realm.commitWrite()
    //    }
    
    
    func fetchLocalData(){
        
        let savedMovies = self.realm.objects(FavoriteMovie.self)
        
        for item in savedMovies {
            if !savedArray.contains(where: {$0.id == item.value(forKey: "id") as! Int}){
                let savedObj = Movie(backdropPath: item.value(forKey: "backdropPath") as? String,
                                     id: item.value(forKey: "id") as! Int,
                                     overview: item.value(forKey: "overview") as! String,
                                     popularity: item.value(forKey: "popularity") as! Double,
                                     posterPath: item.value(forKey: "posterPath") as? String,
                                     releaseDate: item.value(forKey: "releaseDate") as? String,
                                     title: item.value(forKey: "title") as! String,
                                     voteAverage: item.value(forKey: "voteAverage") as! Double)
                savedArray.append(savedObj)
            } else {
                print("already added")
            }
        }
    }
    // MARK: check movie exist in local DB
    //    func isMovieExistInFavorites(selectedMovie : Movie) -> Bool{
    //        var id = selectedMovie.id
    //        guard realm.objects(FavoriteMovie.self).where({$0.id == id}).first != nil else {return false}
    //        return true
    //    }
}

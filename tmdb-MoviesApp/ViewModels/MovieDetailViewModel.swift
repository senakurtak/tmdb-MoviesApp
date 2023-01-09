//
//  MovieDetailViewModel.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 3.01.2023.
//

import Foundation
import UIKit
import CoreData
import RealmSwift

class MovieDetailViewModel : ObservableObject {
    
//    var favArr : [Movie] = []
    
    func saveDataToCoreData(movie: Movie){
        CoreDataHandler.shared.saveToCoreData(movie: movie)
//        self.favArr = CoreDataHandler.shared.savedArr
    }
    
    func deleteDataFromCoreData(movie: Movie){
        CoreDataHandler.shared.deleteData(movie: movie)
    
    }
    
    func saveToRealmDataBase(movie: Movie){
        RealmHandler.shared.setFavoriteMovie(selectedMovie: movie)
    }
    
    func deleteDataFromRealmDataBase(movie: Movie){
        RealmHandler.shared.removeFromFavorites(selectedMovie: movie)

    }
}

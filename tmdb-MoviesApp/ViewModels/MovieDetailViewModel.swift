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

class MovieDetailViewModel : ObservableObject, DataHandler {
        
    func saveLocalData(movie: Movie) {
        CoreDataHandler.shared.saveLocalData(movie: movie)
        RealmHandler.shared.saveLocalData(selectedMovie: movie)

    }
    
    func deletLocaleData(movie: Movie) {
        CoreDataHandler.shared.deletLocaleData(movie: movie)
        RealmHandler.shared.deleteLocalData(selectedMovie: movie)
    }
    
    func fetchLocalData() {
        CoreDataHandler.shared.fetchLocalData()
        RealmHandler.shared.fetchLocalData()
    }
    
    
    // for separated functions before protocol using
    func saveDataToCoreData(movie: Movie){
        CoreDataHandler.shared.saveLocalData(movie: movie)
    }
    
    func deleteDataFromCoreData(movie: Movie){
        CoreDataHandler.shared.deletLocaleData(movie: movie)
        
    }
    
    func saveToRealmDataBase(movie: Movie){
        RealmHandler.shared.saveLocalData(selectedMovie: movie)
    }
    
    func deleteDataFromRealmDataBase(movie: Movie){
        RealmHandler.shared.deleteLocalData(selectedMovie: movie)
        
    }
}

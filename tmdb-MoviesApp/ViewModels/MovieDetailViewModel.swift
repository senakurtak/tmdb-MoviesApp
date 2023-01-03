//
//  MovieDetailViewModel.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 3.01.2023.
//

import Foundation
import UIKit
import CoreData

class MovieDetailViewModel : ObservableObject {
    
    var favArr : [Movie] = []
    
    func saveDataToCoreData(movie: Movie){
        CoreDataHandler.shared.saveToCoreData(movie: movie)
    }
    
    func deleteDataFromCoreData(movie: Movie){
        CoreDataHandler.shared.deleteData(movie: movie)
    }
}

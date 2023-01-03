//
//  MovieSavedViewModel.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 3.01.2023.
//

import Foundation
import CoreData

class MovieSavedViewModel : ObservableObject {
 
    lazy public var favArr = [Movie]()
    
    func fetchCoreDataFavorites(){
        favArr = CoreDataHandler.shared.savedArr
    }
}

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
import RxSwift


class MovieDetailViewModel : ObservableObject {
    
    var favorties = [Movie]()
        
    var service : DataService?
    
    init(service: DataService? = nil) {
        self.service = service
    }
    
    func saveToLocalData(movie: Movie) {
        service?.saveLocalData(movie: movie)
        fetchToLocalData()
    }
    
    func deleteToLocaleData(movie: Movie) {
        service?.deleteLocaleData(movie: movie)
        fetchToLocalData()
    }
    
    func fetchToLocalData() {
        favorties = service?.fetchLocalData() ?? [Movie]()
    }
}

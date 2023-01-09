//
//  DataHandler.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 9.01.2023.
//

import Foundation

protocol DataHandler {
    
    func saveLocalData(movie: Movie)
    func deletLocaleData(movie: Movie)
    func fetchLocalData()
    
}

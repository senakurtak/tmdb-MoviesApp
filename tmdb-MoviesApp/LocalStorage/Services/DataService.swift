//
//  DataService.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 11.01.2023.
//
import Foundation

protocol DataService {
    
    func saveLocalData(movie: Movie)
    func deleteLocaleData(movie: Movie)
    func fetchLocalData() -> [Movie]
    
}

//
//  FavoriteCollections.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 9.01.2023.
//

import Foundation
import RealmSwift

final class FavoriteCollections : Object {
    
    enum MovieTypes: CustomStringConvertible {
        case popular, topRated, upcoming
        
        var description: String {
            switch self {
            case .popular:
                return "Popular"
            case .topRated:
                return "Top Rated"
            case .upcoming:
                return "upcoming"
            }
        }
    }
    
    let popular = List<FavoriteMovie>()
    let topRated = List<FavoriteMovie>()
    let upcoming = List<FavoriteMovie>()
    
    func getCollection(for type: MovieTypes) -> List<FavoriteMovie> {
        switch type {
        case .popular:
            return popular
        case .topRated:
            return topRated
        case .upcoming:
            return upcoming
        }
    }
    
    func persist(_ favoriteMovies: [FavoriteMovie], forType type: MovieTypes){
        
        func update(collection: List<FavoriteMovie>){
            
            guard let realm = collection.realm else { return }
            
            do {
                realm.beginWrite()
                realm.add(favoriteMovies)
                collection.removeAll()
                
                for movie in favoriteMovies {
                    collection.append(movie)
                }
                try realm.commitWrite()
            } catch {
                fatalError("Failed to update movie collection with error: \(error.localizedDescription)")
            }
        }
        
        switch type {
        case .popular:
            update(collection: popular)
        case .upcoming:
            update(collection: upcoming)
        case .topRated:
            update(collection: topRated)
        }
    }
}


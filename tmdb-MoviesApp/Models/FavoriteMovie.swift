//
//  MovieFas.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 3.01.2023.
//

import Foundation
import RealmSwift

class FavoriteMovie: Object{
    
    @objc dynamic var backdropPath: String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var overview: String = ""
    @objc dynamic var popularity: Double = 0.0
    @objc dynamic var posterPath: String = ""
    @objc dynamic var releaseDate: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var voteAverage: Double = 0.0
    //    let genreIDS: [Int]
    
}

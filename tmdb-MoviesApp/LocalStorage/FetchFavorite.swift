//
//  FetchFavorite.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 9.01.2023.
//

import Foundation
import UIKit

protocol FetchFavorite {
    
    var favArr : [Movie] { get set }
    
    
    func fetchFavorites(tableView: UITableView) -> [Movie]
    
    
    //    func fetchCoreDataFavorites(tableView : UITableView) -> [Movie]
    //
    //    func fetchRealmFavorites(tableView: UITableView) -> [Movie]

}


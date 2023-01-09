//
//  MovieSavedViewModel.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 3.01.2023.
//

import Foundation
import UIKit

class MovieSavedViewModel : ObservableObject, FetchFavorite {
    
    var favArr: [Movie] = []
    
    func fetchFavorites(tableView: UITableView) -> [Movie] {
        // her ikisi de birbirine eşit olacak??
        favArr = CoreDataHandler.shared.savedArr
        favArr = RealmHandler.shared.savedArray
        tableView.reloadData()
        return favArr
    }
    
    
        
}


/*lazy public var favArr = [Movie]()

func fetchCoreDataFavorites(tableView : UITableView) -> [Movie]{
    favArr = CoreDataHandler.shared.savedArr
    tableView.reloadData()
    return favArr
}

func fetchRealmFavorites(tableView: UITableView) -> [Movie]{
    favArr = RealmHandler.shared.savedArray
    tableView.reloadData()
    return favArr
}*/

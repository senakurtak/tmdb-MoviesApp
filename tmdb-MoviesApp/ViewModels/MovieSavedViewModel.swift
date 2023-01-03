//
//  MovieSavedViewModel.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 3.01.2023.
//

import Foundation
import CoreData
import UIKit

class MovieSavedViewModel : ObservableObject {
    
    lazy public var favArr = [Movie]()
    
    func fetchCoreDataFavorites(tableView : UITableView) -> [Movie]{
        favArr = CoreDataHandler.shared.savedArr
        tableView.reloadData()
        return favArr
    }
}

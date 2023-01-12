//
//  MovieSavedViewModel.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 11.01.2023.
//

import Foundation
import UIKit

class MovieSavedViewModel : ObservableObject{
    
    var favorties = [Movie]()
    
    var service : DataService?
    
    init(service: DataService? = nil) {
        self.service = service
    }
    
    func fetchToLocalData(tableView: UITableView) -> [Movie]{
        
        favorties = service?.fetchLocalData() ?? []
        tableView.reloadData()
        return favorties
    }
}

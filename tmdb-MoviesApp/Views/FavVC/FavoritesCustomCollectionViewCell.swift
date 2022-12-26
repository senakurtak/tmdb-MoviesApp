//
//  FavoritesCustomCollectionViewCell.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 13.12.2022.
//
import Foundation
import UIKit
import CoreData

class FavoritesCustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var favoriteMovieImage: UIImageView!
    
    @IBOutlet weak var favoriteMovieLabel: UILabel!
    
    var completion: () -> () = { }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var indexPath: Int?
    
    @IBAction func didTappedSaveButton(_ sender: Any) {
        print("didTappedSaveButton tapped!!")
        completion()
    }
}

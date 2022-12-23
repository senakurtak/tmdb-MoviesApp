//
//  FavoritesCustomCollectionViewCell.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 13.12.2022.
//

import UIKit

class FavoritesCustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var favoriteMovieImage: UIImageView!
    
    @IBOutlet weak var favoriteMovieLabel: UILabel!
    
    lazy public var favArr : [Movie] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakafrom nib çalıştı ve favArr'in \(favArr.count) adet üyesi var!!")
        // Initialization code
    }
}

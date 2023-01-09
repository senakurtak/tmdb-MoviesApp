//
//  CustomCollectionViewCell.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 11.11.2022.
//

import UIKit
import RealmSwift

class CustomCollectionViewCell: UICollectionViewCell {
    
//    var favoriteCheck : Bool = false
    
    @IBOutlet weak var images: UIImageView!
    
    @IBOutlet weak var imageLabel: UILabel!
        
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    let moviesViewModel = MovieViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

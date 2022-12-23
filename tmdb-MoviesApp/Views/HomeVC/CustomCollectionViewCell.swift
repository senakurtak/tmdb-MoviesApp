//
//  CustomCollectionViewCell.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 11.11.2022.
//

import UIKit
import RealmSwift

class CustomCollectionViewCell: UICollectionViewCell {
    
    var favoriteCheck : Bool = true
    
    @IBOutlet weak var images: UIImageView!
    
    @IBOutlet weak var imageLabel: UILabel!
    
    @IBAction func favBttn(_ sender: UIButton) {
        favoriteCheck.toggle()
        let image = favoriteCheck ? UIImage(systemName: "heart") : UIImage(systemName:"heart.fill")
        sender.setImage(image, for: .normal)
    }
    
    
    let moviesViewModel = MovieViewModel()
    
    var movieList = [Movie]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

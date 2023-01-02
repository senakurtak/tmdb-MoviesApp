//
//  CustomCollectionViewCell.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 11.11.2022.
//

import UIKit
import RealmSwift

class CustomCollectionViewCell: UICollectionViewCell {
    
    var favoriteCheck : Bool = false
    
    @IBOutlet weak var images: UIImageView!
    
    @IBOutlet weak var imageLabel: UILabel!
    
    @IBAction func didTappedFavoriteButton(_ sender: UIButton) {
        
        
//        ana sayfadaki favori ekleme işlevi kaldırılabilir.
//        favoriteCheck.toggle()
//        let image = favoriteCheck ? UIImage(systemName: "heart") : UIImage(systemName:"heart.fill")
//        sender.setImage(image, for: .normal)
        
    }
    
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    let moviesViewModel = MovieViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(movie: Movie){
        imageLabel.text = movie.title
        let urlString = "https://image.tmdb.org/t/p/w185\(movie.backdropPath ?? "")"
        images.sd_setImage(with: URL(string: urlString))
        if CoreDataHandler.shared.savedArr.contains(where: {$0.id == movie.id}){
            favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
}

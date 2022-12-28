//
//  DetailViewController.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 11.11.2022.
//
import RealmSwift
import UIKit
import Foundation

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var rdLabel: UILabel!
    
    @IBOutlet weak var overviewTextView: UITextView!
    
    @IBOutlet weak var popularLabel: UILabel!
    
    @IBOutlet weak var voteLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var buttonFav: UIButton!
    

    var selectedMovie : Movie?
    var savedMovieList : [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure(){
        checkFav()
        setUpMovie()
    }
    
    func setUpMovie(){
        if let movies = selectedMovie{
            titleLabel.text = movies.title
            overviewTextView.text = movies.overview
            voteLabel.text = "\(movies.voteAverage)"
            popularLabel.text = "\(movies.popularity)"
            let urlString = "https://image.tmdb.org/t/p/w185\(movies.backdropPath ?? "")"
            imageView.sd_setImage(with: URL(string: urlString))
            if let text: String = movies.releaseDate {
                rdLabel.text = text
            }
        }
    }
    
    @IBAction func didTappedFavouriteButton(_ sender: UIButton) {
        
        if CoreDataHandler.shared.savedArr.contains(where: {$0.id == selectedMovie!.id}){
            CoreDataHandler.shared.deleteData(movie: selectedMovie!)
            buttonFav.setImage(UIImage(systemName: "heart"), for: .normal)
            
        } else {
            CoreDataHandler.shared.saveToCoreData(movie: selectedMovie!)
            buttonFav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
        }
    }
    
    func checkFav(){
        if CoreDataHandler.shared.savedArr.contains(where: {$0.id == selectedMovie!.id}){
            CoreDataHandler.shared.deleteData(movie: selectedMovie!)
            buttonFav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            let cell = CustomCollectionViewCell()
            cell.favoriteCheck = true
        }else{
            buttonFav.setImage(UIImage(systemName: "heart"), for: .normal)
            let cell = CustomCollectionViewCell()
            cell.favoriteCheck = false
        }
    }
}

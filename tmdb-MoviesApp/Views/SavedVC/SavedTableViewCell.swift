//
//  SavedTableViewCell.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 28.12.2022.
//

import UIKit

class SavedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var favImage: UIImageView!
    
    @IBOutlet weak var favMovieTitle: UILabel!
    
    @IBOutlet weak var eyeImage: UIImageView!
    
    @IBOutlet weak var favMoviePopularity: UILabel!
    
    @IBOutlet weak var favMovieVote: UILabel!
    
    var selectedMovie : Movie?

    override func awakeFromNib() {
        super.awakeFromNib()
        print("savedtableviewcell çalıştı")
//        setCell(movie: selectedMovie!)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCell(movie: Movie){
        
//        print("movie.title")
//        print("\(movie.voteAverage)")
//        print("\(movie.popularity)")
//        print("https://image.tmdb.org/t/p/w185\(movie.backdropPath ?? "")")
//        print("setcell çalıştı")

        favMovieTitle.text = movie.title
        favMovieVote.text = "\(movie.voteAverage)"
        favMoviePopularity.text = "\(movie.popularity)"
        let urlString = "https://image.tmdb.org/t/p/w185\(movie.posterPath ?? "")"
        favImage.sd_setImage(with: URL(string: urlString))
    }
}

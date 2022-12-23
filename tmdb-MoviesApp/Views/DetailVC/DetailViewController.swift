//
//  DetailViewController.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 11.11.2022.
//
import RealmSwift
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var rdLabel: UILabel!
    
    @IBOutlet weak var overviewTextView: UITextView!
    
    @IBOutlet weak var popularLabel: UILabel!
    
    @IBOutlet weak var voteLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var favoriteCheck : Bool = true
    
    var selectedMovie : Movie?
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            rdLabel.text = "\(movies.releaseDate)"
        }
    }
    
    @IBAction func favButton(_ sender: UIButton) {
        let image = favoriteCheck ? UIImage(systemName: "heart.fill") : UIImage(systemName:"heart")
        sender.setImage(image, for: .normal)
        print("Fav button tapped for \(selectedMovie!.title)")
        renderWithRealm()
        favoriteCheck.toggle()
    }
    
    func save(){
        let favSelectedMovie = FavoriteMovie()
        favSelectedMovie.movieTitle = selectedMovie!.title
        realm.beginWrite()
        realm.add(favSelectedMovie)
        try! realm.commitWrite()
    }
    
    func render(){
        var movie = realm.objects(FavoriteMovie.self)
        for movie in movie{
            selectedMovie?.title = movie.movieTitle
            print("Realm üzerinden\(movie.movieTitle) renderlandı!")
            print(Realm.Configuration.defaultConfiguration.fileURL)
        }
    }
    
    func renderWithRealm(){
        realm.beginWrite()
//        realm.delete(realm.objects(FavoriteMovie.self))
        try! realm.commitWrite()
        save()
        render()

    }
}

class FavoriteMovie: Object{
    @objc dynamic var movieTitle: String = ""
}

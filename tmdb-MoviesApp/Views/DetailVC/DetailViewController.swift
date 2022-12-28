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
    
    
    @IBOutlet weak var buttonFav: UIButton!
    
    var favoriteCheck : Bool = true
    
    var selectedMovie : Movie?
    
    var savedMovieList : [Movie] = []
    
    let realm = try! Realm()
    
    //    var isMovieSaved : Bool = false
    //    var indexOfMovie : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        //        retrieveMovieDetails()
        //        configureFavouriteButton()
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
            rdLabel.text = "\(movies.releaseDate)"
        }
    }
    
    
    func checkFav(){
        if CoreDataHandler.shared.savedArr.contains(where: {$0.id == selectedMovie!.id}){
            CoreDataHandler.shared.deleteData(movie: selectedMovie!)
            buttonFav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            buttonFav.setImage(UIImage(systemName: "heart.fill"), for: .normal)

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
        
        //        let image = favoriteCheck ? UIImage(systemName: "heart.fill") : UIImage(systemName:"heart")
        //        sender.setImage(image, for: .normal)
        //        print("Fav button tapped for \(selectedMovie!.title)")
        //        //        renderWithRealm()
        //        favoriteCheck.toggle()
        
        //        if (!isMovieSaved){
        //            let savedMovie = FavoriteMovies(isSaved: true,
        //                                            backdropPath: selectedMovie?.backdropPath ?? "",
        //                                            overview: selectedMovie?.overview ?? "",
        //                                            popularity: selectedMovie?.popularity ?? 0.0,
        //                                            posterPath: selectedMovie?.posterPath ?? "",
        //                                            releaseDate: selectedMovie?.releaseDate ?? "",
        //                                            title: selectedMovie?.title ?? "",
        //                                            voteAverage: selectedMovie?.voteAverage ?? 0.0)
        //            self.savedMovieList.append(savedMovie)
        //            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.savedMovieList), forKey:"favoriteMovies")
        //
        //        } else {
        //            self.savedMovieList.remove(at: indexOfMovie)
        //            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.savedMovieList), forKey: "favoriteMovies")
        //        }
        //        print("savedMovieList dizisinin \(savedMovieList.count) tane elemanı vardır  \(savedMovieList[0])")
        
    }
    
    
    //    func retrieveMovieDetails() {
    //
    //        if let data = UserDefaults.standard.value(forKey: "favoriteMovies") as? Data {
    //            let favoriteMovies = try? PropertyListDecoder().decode(Array<FavoriteMovies>.self, from: data)
    //            savedMovieList = favoriteMovies ?? []
    //        }
    //
    //    }
    //    func configureFavouriteButton(){
    //                        if (isMovieSaved) {
    //                            favouriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    //                        } else {
    //                            favouriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
    //                        }
    //    }
    
    
    
    
    
    
    
    //    private func checkIfIsSaved(movieName: String?) -> Bool {
    //        if !savedMovieList.contains(where: { $0.title == movieName }) {
    //            return false
    //        } else {
    //            return true
    //        }
    //    }
    //
    //    func checkIfMovieWillSaved(movieName : String?) -> Bool {
    //        if savedMovieList.contains(where: {$0.title == movieName}){
    //            return false
    //        } else {
    //            return true
    //        }
    //    }
    //
    
    
    // Realm ile işlemler için
    //    func save(){
    //        let favSelectedMovie = FavoriteMovie()
    //        favSelectedMovie.movieTitle = selectedMovie!.title
    //        realm.beginWrite()
    //        realm.add(favSelectedMovie)
    //        try! realm.commitWrite()
    //    }
    //
    //    func render(){
    //        var movie = realm.objects(FavoriteMovie.self)
    //        for movie in movie{
    //            selectedMovie?.title = movie.movieTitle
    //            print("Realm üzerinden\(movie.movieTitle) renderlandı!")
    //            print(Realm.Configuration.defaultConfiguration.fileURL)
    //        }
    //    }
    //
    //    func renderWithRealm(){
    //        realm.beginWrite()
    ////        realm.delete(realm.objects(FavoriteMovie.self))
    //        try! realm.commitWrite()
    //        save()
    //        render()
    //
    //    }
    
    //    @IBAction func favButtonClicked(_ sender: Any) {
    //
    //        if CoreDataHandler.shared.savedArr.contains(where: {$0.id == selectedMovie!.id}){
    //            CoreDataHandler.shared.deleteData(movie: selectedMovie!)
    //            favBtn.setImage(UIImage(systemName: "heart"), for: .normal)
    //
    //        } else {
    //            CoreDataHandler.shared.saveToCoreData(movie: selectedMovie!)
    //            favBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    //
    //        }
    //    }
    
}



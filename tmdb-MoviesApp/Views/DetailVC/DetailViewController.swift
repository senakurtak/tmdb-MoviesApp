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
    
    let realm = try! Realm()
    
    var selectedMovie : Movie?
        
    var favoriteCheck : Bool = false
    
    var favMovieID : Int = 100000
    
    var detailViewModel = MovieDetailViewModel(service: RealmDataService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure(){
        detailViewModel.fetchToLocalData()
        checkFav()
        setUpMovie()
    }
    
    @IBAction func didTappedFavouriteButton(_ sender: UIButton) {
        
        favoriteCheck.toggle()
        
        if detailViewModel.favorties.contains(where: {$0.id == selectedMovie!.id}){
            detailViewModel.deleteToLocaleData(movie: selectedMovie!)
            buttonFav.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            detailViewModel.saveToLocalData(movie: selectedMovie!)
            buttonFav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        
        // CoreData
        /* if CoreDataHandler.shared.savedArr.contains(where: {$0.id == selectedMovie!.id}){
         detailViewModel.deleteDataFromCoreData(movie: selectedMovie!)
         buttonFav.setImage(UIImage(systemName: "heart"), for: .normal)
         } else {
         detailViewModel.saveDataToCoreData(movie: selectedMovie!)
         //            CoreDataHandler.shared.saveToCoreData(movie: selectedMovie!)
         buttonFav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
         }
         */
        // protocol kullanmadan önce çalıştırdığım kod bloğu
        // Realm
//        if RealmHandler.shared.savedArray.contains(where: {$0.id == selectedMovie!.id}){
//            detailViewModel.deleteDataFromRealmDataBase(movie: selectedMovie!)
//            buttonFav.setImage(UIImage(systemName: "heart"), for: .normal)
//        } else {
//            detailViewModel.saveToRealmDataBase(movie: selectedMovie!)
//            buttonFav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
//        }
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
                let convertedDateString = convertDateFormat(dateString: text)
                rdLabel.text = convertedDateString
            }
        }
    }
    
    func checkFav(){
        if detailViewModel.favorties.contains(where: {$0.id == selectedMovie!.id}){
            buttonFav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            print("check işlemleri doğru çalışıyor, movie kayıtlı")
        }else{
            buttonFav.setImage(UIImage(systemName: "heart"), for: .normal)
            print("check işlemleri doğru çalışıyor, movie kayıtlı değil")

        }
    }
    // CoreData'ya göre check işlemleri
    //        if CoreDataHandler.shared.savedArr.contains(where: {$0.id == selectedMovie!.id}){
    //            buttonFav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    //        }else{
    //            buttonFav.setImage(UIImage(systemName: "heart"), for: .normal)
    //        }
    func convertDateFormat(dateString: String) -> String {
        // Create a date formatter
        let formatter = DateFormatter()
        
        // Set the input format for the date formatter
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US")
        
        
        // Convert the input string to a date object
        guard let date = formatter.date(from: dateString) else {
            return "Invalid date"
        }
        
        // Set the output format for the date formatter
        formatter.dateFormat = "dd MMM yyyy"
        
        // Convert the date object to a string in the desired output format
        let convertedDateString = formatter.string(from: date)
        
        return convertedDateString
    }
    
}

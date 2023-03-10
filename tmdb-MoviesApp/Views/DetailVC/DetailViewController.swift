//
//  DetailViewController.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 11.11.2022.
//
import RealmSwift
import UIKit
import Foundation
import RxSwift
import RxCocoa


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
    
    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure(){
        detailViewModel.fetchToLocalData()
        checkFav()
        setUpMovie()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        detailViewModel.fetchToLocalData()
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
    }
    
    func setUpMovie(){
        Observable.just(selectedMovie).subscribe(onNext: { response in
            self.titleLabel.text = response?.title
            self.overviewTextView.text = response?.overview
            self.voteLabel.text = "\(response?.voteAverage ?? 0.0)"
            self.popularLabel.text = "\(response?.popularity ?? 0.0)"
            let urlString = "https://image.tmdb.org/t/p/w185\(response?.backdropPath ?? "")"
            self.imageView.sd_setImage(with: URL(string: urlString))
            if let text: String = response?.releaseDate {
                let convertedDateString = self.convertDateFormat(dateString: text)
                self.rdLabel.text = convertedDateString
            }
            
        }
        ).disposed(by: bag)
    }
    
    //        if let movies = selectedMovie{
    //            titleLabel.text = movies.title
    //            overviewTextView.text = movies.overview
    //            voteLabel.text = "\(movies.voteAverage)"
    //            popularLabel.text = "\(movies.popularity)"
    //            let urlString = "https://image.tmdb.org/t/p/w185\(movies.backdropPath ?? "")"
    //            imageView.sd_setImage(with: URL(string: urlString))
    //            if let text: String = movies.releaseDate {
    //                let convertedDateString = convertDateFormat(dateString: text)
    //                rdLabel.text = convertedDateString
    //            }
    //        }
    
    
    func checkFav(){
        if detailViewModel.favorties.contains(where: {$0.id == selectedMovie!.id}){
            buttonFav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            print("check i??lemleri do??ru ??al??????yor, movie kay??tl??")
        }else{
            buttonFav.setImage(UIImage(systemName: "heart"), for: .normal)
            print("check i??lemleri do??ru ??al??????yor, movie kay??tl?? de??il")
            
        }
    }
    
    func convertDateFormat(dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US")
        guard let date = formatter.date(from: dateString) else {
            return "Invalid date"
        }
        formatter.dateFormat = "dd MMM yyyy"
        let convertedDateString = formatter.string(from: date)
        return convertedDateString
    }
}

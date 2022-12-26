//
//  ContentViewController.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 7.12.2022.
//

import UIKit
//import Alamofire
import SDWebImage
import RxSwift
import Moya
import RxCocoa

class ContentViewController: UIViewController  {
        
    @IBOutlet weak var popularLabel: UILabel!
    
    @IBOutlet weak var top_relatedLabel: UILabel!
    
    @IBOutlet weak var upcomingLabel: UILabel!
    
    @IBOutlet weak var collectionViewPopular: UICollectionView!
    
    @IBOutlet weak var collectionViewTopRelated: UICollectionView!
    
    @IBOutlet weak var collectionViewUpcoming: UICollectionView!
    
    let viewModel = MovieViewModel()
    
    var bag = DisposeBag()
    
    var movieList : [Movie] = []
    
    var movieListTopRelated : [Movie] = []
    
    var movieListUpComing : [Movie] = []
    
//    var savedMovieList : [FavoriteMovies] = []
    
    enum Section : Int {
        case popular = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: (13/255), green: (37/255), blue: (63/255), alpha: (0.0))
    }
    
    
//    
//    func checkIfMovieWillSaved(movieName : String?) -> Bool {
//        if savedMovieList.contains(where: {$0.title == movieName}){
//            return false
//        } else {
//            return true
//        }
//    }
//    
//    private func checkIfIsSaved(movieName: String?) -> Bool {
//        if !savedMovieList.contains(where: { $0.title == movieName }) {
//            return false
//        } else {
//            return true
//        }
//    }
//    
//    private func findIndexOfElementInArray(movieName: String?) -> Int {
//        let index = savedMovieList.firstIndex { $0.title == movieName }
//        return index ?? 0
//    }
//    
//    private func retrieveSavedMovies() {
//        if let data = UserDefaults.standard.value(forKey:"favouriteMovies") as? Data {
//            let favouriteMovies = try? PropertyListDecoder().decode(Array<FavoriteMovies>.self, from: data)
//            savedMovieList = favouriteMovies ?? []
//        }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchPopularMovies()
        viewModel.fetchTop_RatedMovies()
        viewModel.fetchUpComingMovies()
        bindCollectionViewData()
        bindUpComingCollectionViewData()
        bindTopRelatedCollectionViewData()
        collectionViewPopular.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewCellID")
        collectionViewUpcoming.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewCellID")
        collectionViewTopRelated.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewCellID")
    }
    
    func bindCollectionViewData(){
        
        self.viewModel.movieList.bind(to: collectionViewPopular.rx.items(cellIdentifier: "collectionViewCellID", cellType: CustomCollectionViewCell.self)){(row, movie, cell) in
            cell.imageLabel.text = movie.title
            let urlString = "https://image.tmdb.org/t/p/w185\(movie.posterPath ?? "")"
            cell.images.sd_setImage(with: URL(string: urlString))
        }.disposed(by: bag)
        
        collectionViewPopular.rx.modelSelected(Movie.self).bind{ model in
            let detailsVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
            detailsVC.selectedMovie = model
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }.disposed(by: bag)
        
    }
    
    func bindTopRelatedCollectionViewData(){
        self.viewModel.movieListTopRelated.bind(to: collectionViewTopRelated.rx.items(cellIdentifier: "collectionViewCellID", cellType: CustomCollectionViewCell.self)){(row, movie, cell) in
            cell.imageLabel.text = movie.title
            let urlString = "https://image.tmdb.org/t/p/w185\(movie.posterPath ?? "")"
            cell.images.sd_setImage(with: URL(string: urlString))
        }.disposed(by: bag)
        
        collectionViewTopRelated.rx.modelSelected(Movie.self).bind{ model in
            let detailsVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
            detailsVC.selectedMovie = model
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }.disposed(by: bag)
    }
    
    func bindUpComingCollectionViewData(){
        self.viewModel.movieListUpComing.bind(to: collectionViewUpcoming.rx.items(cellIdentifier: "collectionViewCellID", cellType: CustomCollectionViewCell.self)){(row, movie, cell) in
            cell.imageLabel.text = movie.title
            let urlString = "https://image.tmdb.org/t/p/w185\(movie.posterPath ?? "")"
            cell.images.sd_setImage(with: URL(string: urlString))
        }.disposed(by: bag)
        
        collectionViewUpcoming.rx.modelSelected(Movie.self).bind{ model in
            let detailsVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
            detailsVC.selectedMovie = model
            self.navigationController?.pushViewController(detailsVC, animated: true)
            // indexOfMovie göndermek için
        }.disposed(by: bag)
    }
}

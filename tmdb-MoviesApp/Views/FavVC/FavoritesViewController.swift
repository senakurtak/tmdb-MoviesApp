//
//  FavoritesViewController.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 13.12.2022.
//

import UIKit
import Foundation
import SDWebImage
import RxSwift
import Moya
import RxCocoa
import CoreData

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var favoriteLabel: UILabel!
    
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    var savedMovieList : [FavoriteMovies] = [] {
        didSet{
            favoriteCollectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteCollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionViewCellID")
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        retrieveSavedMovies()
    }
    
    
    
    func configureTableView(){
        favoriteCollectionView?.indicatorStyle = .white
    }
    
    func retrieveSavedMovies(){
        if let data = UserDefaults.standard.value(forKey: "favoriteMovies") as? Data{
            let favoriteMovies = try?
            PropertyListDecoder().decode(Array<FavoriteMovies>.self, from: data)
            savedMovieList = favoriteMovies ?? []
        }
    }
}
extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        savedMovieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCustomCollectionViewCell", for: indexPath) as! FavoritesCustomCollectionViewCell
        cell.favoriteMovieLabel?.text = savedMovieList[indexPath.row].title
        cell.indexPath = indexPath.row
        cell.completion = {
            self.savedMovieList.remove(at: indexPath.row)
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self.savedMovieList), forKey: "favoriteMovies")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let detailsVC = DetailViewController(nibName: "DetailViewController", bundle: nil) as? DetailViewController {
            detailsVC.titleLabel.text = savedMovieList[indexPath.row].title
            detailsVC.overviewTextView.text = savedMovieList[indexPath.row].overview
            detailsVC.voteLabel.text = "\(savedMovieList[indexPath.row].voteAverage)"
            detailsVC.popularLabel.text = "\(savedMovieList[indexPath.row].popularity)"
            let urlString = "https://image.tmdb.org/t/p/w185\(savedMovieList[indexPath.row].backdropPath ?? "")"
            detailsVC.imageView.sd_setImage(with: URL(string: urlString))
            detailsVC.rdLabel.text = "\(savedMovieList[indexPath.row].releaseDate)"
        }
    }
}

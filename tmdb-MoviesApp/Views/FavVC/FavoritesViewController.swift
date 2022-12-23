//
//  FavoritesViewController.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 13.12.2022.
//

import UIKit
//import Alamofire
import SDWebImage
import RxSwift
import Moya
import RxCocoa

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favoriteLabel: UILabel!
    
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favoriteCollectionView.register(UINib(nibName: "FavoritesCustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "favoritesCustomCollectionViewCellID")

    }
}

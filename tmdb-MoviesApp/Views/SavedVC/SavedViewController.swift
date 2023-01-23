//
//  SavedViewController.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 28.12.2022.
//

import UIKit
import RxSwift
import RxCocoa

class SavedViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var savedMovieTableView: UITableView!
    
    var savedViewModel = MovieSavedViewModel(service: RealmDataService())
    
    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bindViewModel()
        savedViewModel.fetchToLocalData()
    }
    

    func configure(){
        savedMovieTableView.register(UINib(nibName: "SavedTableViewCell", bundle: nil), forCellReuseIdentifier: "SavedTableViewCell")
    }
    
    func bindViewModel(){
        savedViewModel.favorties.bind(to: savedMovieTableView.rx.items(cellIdentifier: "SavedTableViewCell", cellType: SavedTableViewCell.self)){ row, item, cell in
            cell.setCell(movie: item)
            print(item)
        }.disposed(by: bag)
        
        savedMovieTableView.rx.modelSelected(Movie.self).bind{ model in
            let detailsVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
            detailsVC.favMovieID = model.id
            detailsVC.selectedMovie = model
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }.disposed(by: bag)
    }
}

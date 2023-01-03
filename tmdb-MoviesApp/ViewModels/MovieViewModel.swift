//
//  MovieViewModel.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 14.11.2022.
//

import Moya
import RxSwift
import UIKit
import RxCocoa
import RxRelay


class MovieViewModel : ObservableObject {
    
    var movieList = PublishSubject<[Movie]>()
    
    var movieListTopRelated = PublishSubject<[Movie]>()
    
    var movieListUpComing = PublishSubject<[Movie]>()
    
    var dictionary : [String:[Movie]] = [:]
    
    var bag : DisposeBag = DisposeBag()
    
    func fetchPopularMovies() {
        NetworkManager.shared.fetchPopularMovies().subscribe(onNext: { response in
            self.dictionary["Popular"] = response.results
            self.movieList.onNext(response.results)
            print(self.movieList)
        }, onError: { error in
            print(error.localizedDescription)
        }
        ).disposed(by: bag)
    }
    
    func fetchTop_RatedMovies() {
        NetworkManager.shared.fetchTop_RatedMovies().subscribe(onNext: { response in
            self.dictionary["Top_Rated"] = response.results
            self.movieListTopRelated.onNext(response.results)
            print(self.movieList)
        }, onError: { error in
            print(error.localizedDescription)
        }
        ).disposed(by: bag)
    }
    
    func fetchUpComingMovies() {
        NetworkManager.shared.fetchUpComingMovies().subscribe(onNext: { response in
            self.dictionary["UpComing"] = response.results
            self.movieListUpComing.onNext(response.results)
            print(self.movieList)
        }, onError: { error in
            print(error.localizedDescription)
        }
        ).disposed(by: bag)
    }
}

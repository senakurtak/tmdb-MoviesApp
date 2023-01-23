//
//  MovieSavedViewModel.swift
//  tmdb-MoviesApp
//
//  Created by Sena Kurtak on 11.01.2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class MovieSavedViewModel : ObservableObject{
        
    var service : DataService?
    
    var favorties = PublishSubject <[Movie]>()
    
    var bag : DisposeBag = DisposeBag()
    
    init(service: DataService? = nil) {
        self.service = service
    }
    
    func fetchToLocalData() {
        let movieArray = service?.fetchLocalData()
        Observable.from(optional: movieArray).subscribe(onNext: { response in
            self.favorties.onNext(response)
        }, onError: { error in
            print(error.localizedDescription)
        }
        ).disposed(by: bag)
    }
}

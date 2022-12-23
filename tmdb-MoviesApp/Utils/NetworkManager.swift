//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 11.11.2022.
//

import Foundation
import Moya
import RxSwift
import RxMoya

protocol Networkable{
    var provider: MoyaProvider<API> { get }
    func fetchPopularMovies() -> Observable<MovieResponse>
}

class NetworkManager: Networkable {
    
    var provider = MoyaProvider<API>()
    static let shared  = NetworkManager()
    
    func fetchPopularMovies() -> Observable<MovieResponse> {
        request(target: .popular)
    }
    func fetchTop_RatedMovies() -> Observable<MovieResponse> {
        request(target: .top_rated)
    }
    func fetchUpComingMovies() -> Observable<MovieResponse> {
        request(target: .upcoming)
    }

    func request<T: Codable>(target: API) -> Observable<T>{
        provider.rx.request(target)
            .asObservable()
            .filterSuccessfulStatusAndRedirectCodes().map{ (result) in
                return try result.map ( T.self )
            }
            .catch { error in
                return Observable.error(error)
            }
    }
}

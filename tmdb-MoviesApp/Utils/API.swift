//
//  API.swift
//  MoviesApp
//
//  Created by Sena Kurtak on 11.11.2022.
//

import Moya
import UIKit

enum API {
    case popular
    case top_rated
    case upcoming
}

extension API: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .popular:
            return "popular"
        case .top_rated:
            return "top_rated"
        case .upcoming:
            return "upcoming"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .popular,.top_rated, .upcoming:
            return .requestParameters(parameters: ["api_key": Constants.API.apiKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

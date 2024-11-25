//
//  SearchTargetType.swift
//  KREAM
//
//  Created by 오현민 on 11/23/24.
//

import Foundation
import Moya

enum SearchTargetType {
    case getSearchResult(query: String)
}

extension SearchTargetType: TargetType {
    var baseURL: URL {
        guard let baseURL = URL(string: "https://dummyjson.com") else {
            fatalError("Error: Invalid URL")
        }
        
        return baseURL
    }
    
    var path: String {
        switch self {
        case .getSearchResult:
            return "/products/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getSearchResult:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getSearchResult(let query):
            return .requestParameters(parameters: ["q": query], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getSearchResult:
            return ["Content-Type" : "application/json"]
        }
    }
    
    
}

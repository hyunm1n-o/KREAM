//
//  SearchResultDataManager.swift
//  KREAM
//
//  Created by 오현민 on 11/24/24.
//

import Foundation
import Moya

class SearchResultDataManager {
    private let provider = MoyaProvider<SearchTargetType>()
    
    public func getSearchResult(query: String, completion: @escaping (SearchResponseModel?) -> Void) {
        provider.request(.getSearchResult(query: query)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let searchResult = try decoder.decode(SearchResponseModel.self, from: response.data)
                    print("Successfully mapped response: \(searchResult)")
                    completion(searchResult)
                } catch {
                    print("Mapping error: \(error.localizedDescription)")
                    completion(nil)
                }
            case .failure(let error):
                print("Network request error: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
    
}

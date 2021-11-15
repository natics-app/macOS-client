//
//  Interface+WatchList.swift
//  Natics
//
//  Created by Farrel Anshary on 14/11/21.
//

import Foundation
import Combine

// WatchList interface functions
protocol WatchListInterface: Service {
    func getNumberOfCases(category_id: Int) -> AnyPublisher<MCBaseResponse<NewsAnimalCategoryResponse>, MCBaseErrorModel>
    func getRank(category_id: Int) -> AnyPublisher<MCBaseResponse<AnimalRankGetResponse>, MCBaseErrorModel>
}

enum WatchListDescription {
    case getNumberOfCases(categoryId: Int)
    case getRank(categoryId: Int)
}

extension WatchListDescription: NetworkDescription {
    var path: String {
        switch self {
        case .getRank(let id):
            return "/api/general/trending/rank/\(id)"
        case .getNumberOfCases(let id):
            return "/api/general/trending/animals/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .GET
        }
    }
    
    var queryParams: [String : String]? {
        return [
            "api_key": Constants.ServerEnvironment.apiKey,
            "start": "2018-01-01",
            "end": "2021-11-20"
        ]
    }
}

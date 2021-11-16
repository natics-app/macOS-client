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
    func getNumberOfCases(category_id: Int, startDate: String, endDate: String) -> AnyPublisher<MCBaseResponse<NewsAnimalCategoryResponse>, MCBaseErrorModel>
    func getRank(category_id: Int, startDate: String, endDate: String) -> AnyPublisher<MCBaseResponse<AnimalRankGetResponse>, MCBaseErrorModel>
}

enum WatchListDescription {
    case getNumberOfCases(categoryId: Int, startDate: String, endDate: String)
    case getRank(category_id: Int, startDate: String, endDate: String)
}

extension WatchListDescription: NetworkDescription {
    var path: String {
        switch self {
        case .getRank(let id, _, _):
            return "/api/general/trending/rank/\(id)"
        case .getNumberOfCases(let id, _, _):
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

        
        switch self {
            case .getNumberOfCases(_ , let sd, let ed),
                .getRank(_ , let sd, let ed):
            return [
                "api_key": Constants.ServerEnvironment.apiKey,
                "start": sd,
                "end": ed
            ]
        }
    }
}

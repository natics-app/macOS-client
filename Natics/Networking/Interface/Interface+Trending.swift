//
//  Interface+Trending.swift
//  Natics
//
//  Created by Jackie Leonardy on 15/11/21.
//

import Foundation
import Combine

protocol TrendingInterface: Service {
    func getTrendingProvince() -> AnyPublisher<Response, MCBaseErrorModel>
}

enum TrendingDescription {
    case getTrendingProvince
}

extension TrendingDescription: NetworkDescription {
    var path: String {
        switch self {
        case .getTrendingProvince:
            return "/api/general/trending/region"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .GET
        }
    }
    
    var queryParams: [String : String]? {
        return ["api_key" : Constants.ServerEnvironment.apiKey]
    }
    
}


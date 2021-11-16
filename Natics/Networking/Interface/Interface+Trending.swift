//
//  Interface+Trending.swift
//  Natics
//
//  Created by Jackie Leonardy on 15/11/21.
//

import Foundation
import Combine

protocol TrendingInterface: Service {
    func getTrendingProvince(startDate: String, endDate: String) -> AnyPublisher<MCBaseResponse<TrendingProvinceGetResponse>, MCBaseErrorModel>
}

enum TrendingDescription {
    case getTrendingProvince(startDate: String, endDate: String)
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
        switch self {
            case .getTrendingProvince(let sd, let ed):
                return ["api_key" : Constants.ServerEnvironment.apiKey,
                        "start": sd,
                        "end": ed]
        }
    }
    
}


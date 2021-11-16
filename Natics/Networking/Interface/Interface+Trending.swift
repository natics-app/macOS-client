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
    func getTrendingRisingCases(startDate: String, endDate: String) -> AnyPublisher<MCBaseResponse<TrendingRisingCasesGetResponse>, MCBaseErrorModel>
    func getTrendingAnimals(startDate: String, endDate: String) -> AnyPublisher<MCBaseResponse<TrendingAnimalGetResponse>, MCBaseErrorModel>
    func getNumberOfCases() -> AnyPublisher<MCBaseResponse<GetNumberCasesOfResponse>, MCBaseErrorModel>
}

enum TrendingDescription {
    case getTrendingProvince(startDate: String, endDate: String)
    case getTrendingRisingCases(startDate: String, endDate: String)
    case getTrendingAnimals(startDate: String, endDate: String)
    case getNumberOfCases
}

extension TrendingDescription: NetworkDescription {
    var path: String {
        switch self {
        case .getTrendingProvince:
            return "/api/general/trending/region"
        case .getTrendingRisingCases:
            return "/api/general/trending/rising"
        case .getTrendingAnimals, .getNumberOfCases:
            return "/api/general/trending/animals"
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
            case .getTrendingProvince(let sd, let ed),
                .getTrendingRisingCases(let sd, let ed),
                .getTrendingAnimals(let sd, let ed):
                return ["api_key" : Constants.ServerEnvironment.apiKey,
                        "start": sd,
                        "end": ed]
            case .getTrendingProvince(let sd, let ed):
                return [
                    "api_key" : Constants.ServerEnvironment.apiKey,
                    "start": sd,
                    "end": ed
                ]
        case .getNumberOfCases:
            return [
                "api_key" : Constants.ServerEnvironment.apiKey,
            ]
        }
    }
    
}


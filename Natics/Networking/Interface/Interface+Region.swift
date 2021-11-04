//
//  Interface+Region.swift
//  Natics
//
//  Created by Puras Handharmahua on 04/11/21.
//

import Foundation
import Combine

// Region interface functions
protocol RegionInterface {
    func getAllProvince() -> AnyPublisher<MCBaseResponse<RegionGetResponse>, MCBaseErrorModel>
    func getAllRegencies()
}

// Region Request enum
enum RegionDescription {
    case getAllProvince
    case getAllRegencies(provinceId: Int)
}

// Region Description
extension RegionDescription: NetworkDescription {
    var path: String {
        switch self {
        case .getAllProvince:
            return "/api/general/provinces"
        case .getAllRegencies(let id):
            return "/api/general/regencies/\(id)"
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

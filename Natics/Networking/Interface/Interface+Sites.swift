//
//  Interface+Sites.swift
//  Natics
//
//  Created by Puras Handharmahua on 16/11/21.
//

import Foundation
import Combine

// Region interface functions
protocol SitesInterface: Service {
    func getActiveMedia(startDate: String, endDate: String) -> AnyPublisher<MCBaseResponse<ActiveMediaGetResponse>, MCBaseErrorModel>
}

// Region Request enum
enum SitesDescription {
    case getActiveMedia(startDate: String, endDate: String)
}

// Region Description
extension SitesDescription: NetworkDescription {
    var path: String {
        switch self {
        case .getActiveMedia:
            return "/api/general/trending/sites"

        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .GET
        }
    }
    
    var queryParams: [String : String]? {
        switch self{
        case .getActiveMedia(startDate: let sd, endDate: let ed):
            return ["api_key" : Constants.ServerEnvironment.apiKey,
                    "start": sd,
                    "end": ed]
        }
    }
}

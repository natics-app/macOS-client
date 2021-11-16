//
//  Interface+Cases.swift
//  Natics
//
//  Created by Christian Adiputra on 15/11/21.
//

import Foundation
import Combine

// Cases interface functions
protocol CasesInterface: Service {
    func getAllCases() -> AnyPublisher<MCBaseResponse<CasesGetResponse>, MCBaseErrorModel>
}

// Cases Request enum
enum CasesDescription {
    case getAllCases
}

// Cases Description
extension CasesDescription: NetworkDescription {
    
    var path: String {
        switch self {
        case .getAllCases:
            return "/api/general/news"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .GET
        }
    }
    
    var headers: [String : String]? {
        return [
            "Accept" : "application/json"
        ]
    }
    
    var queryParams: [String : String]? {
        return ["api_key" : Constants.ServerEnvironment.apiKey,
                "start" : "2020-10-31",
                "end" : "2021-11-11"]
    }
    
}

//
//  Request+CasesCategories.swift
//  Natics
//
//  Created by Peter Lee on 16/11/21.
//

import Foundation
import Combine

protocol CasesCategoriesInterface: Service {
    func getCasesCategories(startDate: String, endDate: String) -> AnyPublisher<MCBaseResponse<CasesCategoriesGetResponse>, MCBaseErrorModel>
}

enum CasesCategoriesDescription {
    case getCasesCategories(startDate: String, endDate: String)
}

extension CasesCategoriesDescription: NetworkDescription {
    var path: String {
        switch self {
        case .getCasesCategories:
            return "/api/general/trending/labels"
        }
    }
    
    var method: HTTPMethod {
        switch self{
        default:
            return .GET
        }
    }
    
    var queryParams: [String : String]? {
        switch self {
        case .getCasesCategories(startDate: let sd, endDate: let ed):
            return ["api_key" : Constants.ServerEnvironment.apiKey,
                    "start": sd,
                    "end": ed]
        }
    }
}

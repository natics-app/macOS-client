//
//  Interface+Animals.swift
//  Natics
//
//  Created by Puras Handharmahua on 16/11/21.
//

import Foundation
import Combine

// Region interface functions
protocol AnimalsInterface: Service {
    
}

// Region Request enum
enum AnimalsDescription {
    
}

// Region Description
extension AnimalsDescription: NetworkDescription {
    var path: String {
        switch self {
        default:
            return ""
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


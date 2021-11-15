//
//  Request+Region.swift
//  Natics
//
//  Created by Puras Handharmahua on 04/11/21.
//

import Foundation
import Combine

// Region Request service information
struct RegionRequest: Service {
    var baseUrl: String = Constants.Endpoint.databaseServer
    typealias Network = RegionDescription
}

// Reqion Request function
extension RegionRequest: RegionInterface {
    func getAllProvince() -> AnyPublisher<MCBaseResponse<RegionGetResponse>, MCBaseErrorModel> {
        let call = Connector<Network, MCBaseResponse<RegionGetResponse>>()
        return call.doConnect(request: Network.getAllProvince, baseUrl: baseUrl)
    }
    
    func getAllRegencies() {
        
    }
}

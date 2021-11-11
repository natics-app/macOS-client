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
    typealias Response = MCBaseResponse<RegionGetResponse>
}

// Reqion Request function
extension RegionRequest: RegionInterface {
    func getAllProvince() -> AnyPublisher<Response, MCBaseErrorModel> {
        let call = Connector<Network, Response>()
        return call.doConnect(request: Network.getAllProvince, baseUrl: baseUrl)
    }
    
    func getAllRegencies() {
        
    }
}

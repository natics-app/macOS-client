//
//  Request+Trending.swift
//  Natics
//
//  Created by Jackie Leonardy on 15/11/21.
//

import Foundation
import Combine


// Trending Request service information
struct TrendingProvinceRequest: Service {
    var baseUrl: String = Constants.Endpoint.databaseServer
    typealias Network = TrendingDescription
    typealias Response = MCBaseResponse<TrendingProvinceGetResponse>
    
}

extension TrendingProvinceRequest: TrendingInterface {
    func getTrendingProvince() -> AnyPublisher<Response, MCBaseErrorModel> {
        let call = Connector<Network, Response>()
        return call.doConnect(request: Network.getTrendingProvince, baseUrl: baseUrl)
    }
    
    
}

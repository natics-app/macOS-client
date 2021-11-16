//
//  Request+Trending.swift
//  Natics
//
//  Created by Jackie Leonardy on 15/11/21.
//

import Foundation
import Combine


// Trending Request service information
struct TrendingRequest: Service {
    var baseUrl: String = Constants.Endpoint.databaseServer
    typealias Network = TrendingDescription
}

extension TrendingRequest: TrendingInterface {
    func getTrendingProvince(startDate: String, endDate: String) -> AnyPublisher<MCBaseResponse<TrendingProvinceGetResponse>, MCBaseErrorModel> {
        let call = Connector<Network, MCBaseResponse<TrendingProvinceGetResponse>>()
        return call.doConnect(request: Network.getTrendingProvince(startDate: startDate, endDate: endDate), baseUrl: baseUrl)
    }
    
    func getTrendingRisingCases(startDate: String, endDate: String) -> AnyPublisher<MCBaseResponse<TrendingRisingCasesGetResponse>, MCBaseErrorModel> {
        let call = Connector<Network, MCBaseResponse<TrendingRisingCasesGetResponse>>()
        return call.doConnect(request: Network.getTrendingRisingCases(startDate: startDate, endDate: endDate), baseUrl: baseUrl)
    }
    
}

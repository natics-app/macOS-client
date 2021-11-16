//
//  Request+WatchList.swift
//  Natics
//
//  Created by Farrel Anshary on 14/11/21.
//

import Foundation
import Combine

// WatchList Request service information
struct WatchListRequest: Service {
    var baseUrl: String = Constants.Endpoint.databaseServer
    typealias Network = WatchListDescription
}

extension WatchListRequest: WatchListInterface {
    func getNumberOfCases(category_id: Int, startDate: String, endDate: String) -> AnyPublisher<MCBaseResponse<NewsAnimalCategoryResponse>, MCBaseErrorModel> {
        let call = Connector<Network, MCBaseResponse<NewsAnimalCategoryResponse>>()
        return call.doConnect(request: Network.getNumberOfCases(categoryId: category_id, startDate: startDate, endDate:  endDate), baseUrl: baseUrl)
    }
    
    func getRank(category_id: Int, startDate: String, endDate: String) -> AnyPublisher<MCBaseResponse<AnimalRankGetResponse>, MCBaseErrorModel> {
        let call = Connector<Network, MCBaseResponse<AnimalRankGetResponse>>()
        return call.doConnect(request: Network.getRank(category_id: category_id, startDate: startDate, endDate: endDate), baseUrl: baseUrl)
    }
}

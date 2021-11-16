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
    func getNumberOfCases(category_id: Int) -> AnyPublisher<MCBaseResponse<NewsAnimalCategoryResponse>, MCBaseErrorModel> {
        let call = Connector<Network, MCBaseResponse<NewsAnimalCategoryResponse>>()
        return call.doConnect(request: Network.getNumberOfCases(categoryId: category_id), baseUrl: baseUrl)
    }
    
    func getRank(category_id: Int) -> AnyPublisher<MCBaseResponse<AnimalRankGetResponse>, MCBaseErrorModel> {
        let call = Connector<Network, MCBaseResponse<AnimalRankGetResponse>>()
        return call.doConnect(request: Network.getRank(categoryId: category_id), baseUrl: baseUrl)
    }
}

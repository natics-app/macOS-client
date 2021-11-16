//
//  Request+CasesCategories.swift
//  Natics
//
//  Created by Peter Lee on 16/11/21.
//

import Foundation
import Combine

struct CasesCategoriesRequest: Service {
    var baseUrl: String = Constants.Endpoint.databaseServer
    typealias Network = CasesCategoriesDescription
}

extension CasesCategoriesRequest: CasesCategoriesInterface {
    
    func getCasesCategories(startDate: String, endDate: String) -> AnyPublisher<MCBaseResponse<CasesCategoriesGetResponse>, MCBaseErrorModel> {
        let call = Connector<Network, MCBaseResponse<CasesCategoriesGetResponse>>()
        return call.doConnect(request: Network.getCasesCategories(startDate: startDate, endDate: endDate), baseUrl: baseUrl)
    }
    

}

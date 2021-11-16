//
//  Request+Cases.swift
//  Natics
//
//  Created by Christian Adiputra on 15/11/21.
//

import Foundation
import Combine

//Cases Request service information
struct CasesRequest: Service {
    var baseUrl: String = Constants.Endpoint.databaseServer
    typealias Network = CasesDescription
}

// Cases Request function

extension CasesRequest: CasesInterface {
    func getAllCases() -> AnyPublisher<MCBaseResponse<CasesGetResponse>, MCBaseErrorModel> {
        let call =  Connector<Network,MCBaseResponse<CasesGetResponse>>()
        return call.doConnect(request: Network.getAllCases, baseUrl: baseUrl)
    }
    
    
}

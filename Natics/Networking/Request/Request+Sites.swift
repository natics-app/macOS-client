//
//  Request+Sites.swift
//  Natics
//
//  Created by Puras Handharmahua on 16/11/21.
//

import Foundation
import Combine

// Region Request service information
struct SitesRequest: Service {
    var baseUrl: String = Constants.Endpoint.databaseServer
    typealias Network = SitesDescription
}

// Reqion Request function
extension SitesRequest: SitesInterface {

}

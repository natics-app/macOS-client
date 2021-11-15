//
//  Request+Organizations.swift
//  Natics
//
//  Created by Puras Handharmahua on 16/11/21.
//

import Foundation
import Combine

// Region Request service information
struct OrganizationsRequest: Service {
    var baseUrl: String = Constants.Endpoint.databaseServer
    typealias Network = OrganizationsDescription
}

// Reqion Request function
extension UsersRequest: OrganizationsInterface {

}

//
//  Request+Users.swift
//  Natics
//
//  Created by Puras Handharmahua on 16/11/21.
//

import Foundation
import Combine

// Region Request service information
struct UsersRequest: Service {
    var baseUrl: String = Constants.Endpoint.databaseServer
    typealias Network = UsersDescription
}

// Reqion Request function
extension UsersRequest: UsersInterface {

}

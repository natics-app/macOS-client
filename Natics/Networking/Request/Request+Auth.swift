//
//  Request+Auth.swift
//  Natics
//
//  Created by Puras Handharmahua on 16/11/21.
//

import Foundation
import Combine

// Region Request service information
struct AuthRequest: Service {
    var baseUrl: String = Constants.Endpoint.databaseServer
    typealias Network = AuthDescription
}

// Reqion Request function
extension AuthRequest: AuthInterface {

}

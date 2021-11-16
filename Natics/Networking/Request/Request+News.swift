//
//  Request+News.swift
//  Natics
//
//  Created by Puras Handharmahua on 16/11/21.
//

import Foundation
import Combine

// Region Request service information
struct NewsRequest: Service {
    var baseUrl: String = Constants.Endpoint.databaseServer
    typealias Network = NewsDescription
}

// Reqion Request function
extension NewsRequest: NewsInterface {

}

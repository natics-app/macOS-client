//
//  Request+Animals.swift
//  Natics
//
//  Created by Puras Handharmahua on 16/11/21.
//

import Foundation
import Combine

// Region Request service information
struct AnimalsRequest: Service {
    var baseUrl: String = Constants.Endpoint.databaseServer
    typealias Network = AnimalsDescription
}

// Reqion Request function
extension AnimalsRequest: AnimalsInterface {

}

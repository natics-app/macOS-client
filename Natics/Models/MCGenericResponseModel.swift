//
//  MCGenericResponseModel.swift
//  Natics
//
//  Created by Puras Handharmahua on 03/11/21.
//

import Foundation

struct MCBaseResponse<T>: Codable where T: Codable {
    let message: String?
    let data: T?
}

struct MCBaseErrorModel: Codable {
    var name, message: String?
    var code, status: Int?
    var type: String?
    var cache: Data?
}

enum BaseError {
    case unexpected(cache: Data?)
    case unknown(cache: Data?)
    case InternalServerError(status: Int?, cache: Data?)
    case Unreachable(cache: Data?)
    case ParseError(cache: Data?)
    
    var desc: MCBaseErrorModel {
        switch self {
        case .unexpected(let cache):
            return MCBaseErrorModel(name: "Unexpected Error", message: "Unexpected Error", code: 404, status: 404, type: "Unexpected", cache: cache)
        case .unknown(let cache):
            return MCBaseErrorModel(name: "Unknown Error", message: "Unkown Error", code: 510, status: 510, type: "Unknown", cache: cache)
        case .InternalServerError(let status, let cache):
            return MCBaseErrorModel(name: "Internal Server Error", message: "We are experiencing problem to connect to our server. Please try again...", code: status, status: status, type: "Internal Server", cache: cache)
        case .Unreachable(let cache):
            return MCBaseErrorModel(name: "Network Issue", message: "Check your connection and try again", code: 0, status: 0, type: "Network Issue", cache: cache)
        case .ParseError(let cache):
            return MCBaseErrorModel(name: "Parse Error", message: "Failed to parse data", code: 1404, status: 14014, type: "Parse Data Failed", cache: cache)
        }
    }
}

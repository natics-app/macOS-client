//
//  MCGenericResponseModel.swift
//  Natics
//
//  Created by Puras Handharmahua on 03/11/21.
//

import Foundation

// General response for all request
struct MCBaseResponse<T>: Codable where T: Codable {
    let message: String?
    let data: T?
}

// Error response model
struct MCBaseErrorModel: Codable, Error {
    var name, message: String?
    var code, status: Int?
    var type: String?
    var cache: Data?
}


enum BaseError {
    // General error enum
    case unexpected(cache: Data?)
    case unknown(cache: Data?)
    case Unreachable(cache: Data?)
    case ParseError(cache: Data?)
    
    // With Status Code
    case InternalServerError(status: Int?, cache: Data?)
    case BadRequest(status: Int?, cache: Data?)
    case Unauthorized(status: Int?, cache: Data?)
    case Forbidden(status: Int?, cache: Data?)
    case NotFound(status: Int?, cache: Data?)
    case Error4xx(status: Int?, cache: Data?)
    case Error5xx(status: Int?, cache: Data?)
    
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
            return MCBaseErrorModel(name: "Parse Error", message: "Failed to parse data", code: 1404, status: 1404, type: "Parse Data Failed", cache: cache)
        case .BadRequest(let status, let cache):
            return MCBaseErrorModel(name: "Bad Request", message: "Bad Request", code: status, status: status, type: "Bad Request", cache: cache)
        case .Unauthorized(let status, let cache):
            return MCBaseErrorModel(name: "Unauthorized", message: "Unauthorized", code: status, status: status, type: "Unauthorized", cache: cache)
        case .Forbidden(let status, let cache):
            return MCBaseErrorModel(name: "Forbidden", message: "Forbidden", code: status, status: status, type: "Forbidden", cache: cache)
        case .NotFound(let status, let cache):
            return MCBaseErrorModel(name: "Not Found", message: "Not Found", code: status, status: status, type: "Not Found", cache: cache)
        case .Error4xx(let status, let cache):
            return MCBaseErrorModel(name: "Error4xx", message: "Error4xx", code: status, status: status, type: "Error4xx", cache: cache)
        case .Error5xx(let status, let cache):
            return MCBaseErrorModel(name: "Error5xx", message: "Error5xx", code: status, status: status, type: "Error5xx", cache: cache)

        }
    }
}

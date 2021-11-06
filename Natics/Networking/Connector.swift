//
//  Connector.swift
//  Natics
//
//  Created by Puras Handharmahua on 03/11/21.
//

import Foundation
import Combine

struct Connector<N, S> where N: NetworkDescription, S: Codable {
    
    let urlSession = URLSession.shared
    
    // METHODS
    /// Dispatches an URLRequest and returns a publisher
    /// - Parameter request: URLRequest
    /// - Returns: A publisher with the provided decoded data or an error
    func doConnect(request: N, baseUrl: String) -> AnyPublisher<S, MCBaseErrorModel> {
        
        guard let urlRequest = request.asURLRequest(baseURL: baseUrl) else {
            return Fail(
                outputType: S.self,
                failure: BaseError.Unreachable(cache: nil).desc
            ).eraseToAnyPublisher()
        }
        
        return urlSession
            .dataTaskPublisher(for: urlRequest)
            .tryMap({ (data: Data, response: URLResponse)  in // Map on Request response
                // If the response is invalid, throw an error
//                print("debugNetwork: \(String(data: data, encoding: .utf8))")
                if let response = response as? HTTPURLResponse,
                   !(200...299).contains(response.statusCode) {
//                    print("debugNetwork: \(String(data: data, encoding: .utf8))")
                    throw httpError(response.statusCode)
                }
                return data
            })
            .decode(type: S.self, decoder: JSONDecoder()) // Decode data using our ReturnType
            .mapError({ err in // Handle any decoding errors
                handleError(err)
            })
            .eraseToAnyPublisher()
    }
}

extension Connector {
    /// Parses a HTTP StatusCode and returns a proper error
    /// - Parameter statusCode: HTTP status code
    /// - Returns: Mapped Error
    private func httpError(_ statusCode: Int) -> MCBaseErrorModel {
        switch statusCode {
        case 400: return BaseError.BadRequest(status: statusCode, cache: nil).desc
        case 401: return BaseError.Unauthorized(status: statusCode, cache: nil).desc
        case 403: return BaseError.Forbidden(status: statusCode, cache: nil).desc
        case 404: return BaseError.NotFound(status: statusCode, cache: nil).desc
        case 402, 405...499: return BaseError.Error4xx(status: statusCode, cache: nil).desc
        case 500: return BaseError.InternalServerError(status: statusCode, cache: nil).desc
        case 501...599: return BaseError.Error5xx(status: statusCode, cache: nil).desc
        default: return BaseError.unexpected(cache: nil).desc
        }
    }
    
    /// Parses URLSession Publisher errors and return proper ones
    /// - Parameter error: URLSession publisher error
    /// - Returns: Readable NetworkRequestError
    private func handleError(_ error: Error) -> MCBaseErrorModel {
        switch error {
        case is Swift.DecodingError:
            return BaseError.ParseError(cache: nil).desc
        case _ as URLError:
            return BaseError.Unreachable(cache: nil).desc
        case let error as MCBaseErrorModel:
            return error
        default:
            return BaseError.unexpected(cache: nil).desc
        }
    }
}

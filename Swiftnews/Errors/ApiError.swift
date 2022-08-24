//
//  ApiError.swift
//  Swiftnews
//
//  Created by GB on 8/24/22.
//

import Foundation


enum ApiError: Error{
    case decodingError
    case errorCode(Int)
    case unknown
}

extension ApiError : LocalizedError{
    var errorDescription: String?{
        switch self {
        case .decodingError:
            return "Failed to decode the error from the service"
        case .errorCode(let code):
            return "\(code) - something went wrong"
        case .unknown:
            return "The error is unknown"
        }
    }
}

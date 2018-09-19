//
//  APIError.swift
//  DemoRxSwift
//
//  Created by phan.xuan.thuan on 8/28/18.
//  Copyright © 2018 phan.xuan.thuan. All rights reserved.
//

import Foundation
import ObjectMapper

enum APIError: Error, LocalizedError {
    // TODOs: Add Case
    case parserJsonError
    case unauthorized
    case unauthenticated
    case networkError
    case apiFailure(code: String?, message: String)
    case encodingFail
    case timeout
    case expiredToken
    
    public var value: String {
        return String(describing: self)
    }
    
    public var errorDescription: String? {
        // TODOs: Keep update this with new API
        // TODOs: Add those error message foreach case to Localization files
        switch self {
        case .apiFailure(let errorCode, let message):
            print("ERROR WITH API ERROR CODE: \(String(describing: errorCode))")
            return "API_PARSER_ERROR"
        case .networkError:
            return "API_SERVER_CONNECT_FAIL_ERROR"
        case .unauthorized, .unauthenticated:
            return nil
        case .parserJsonError:
            return "API_PARSER_ERROR"
        case .encodingFail:
            return "API_PARSER_ERROR"
        case .timeout:
            return "API_SERVER_CONNECT_FAIL_ERROR"
        case .expiredToken:
            return "API_EXPIRED_TOKEN_ERROR"
        }
    }
}
extension APIError: Equatable {
    public static func == (lhs: APIError, rhs: APIError) -> Bool {
        return lhs.value == rhs.value
    }
}

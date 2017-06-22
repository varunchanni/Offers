//
//  AppError.swift
//  DealsApp
//
//  Created by Varun Channi on 22/06/17.
//  Copyright © 2017 Nagarro. All rights reserved.
//

import Foundation

enum AppErrorType: Int {
    case apiFailure
    case jsonSerializationFailed
    case jsonDictionaryError
    case allFieldNotEntered
    case invalidEmail
    case invalidPassword
    case inValidApiResponse
    case apiError
    case invalidStatusCode
    case notReachable
}

extension Error {
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
    var description: String { return (self as NSError).localizedDescription }
}

class AppError: NSObject {
    
    var errorType: AppErrorType?
    var errorCode: String?
    var errorDescription: String?
    
    init(withType type: AppErrorType, withCode code: String = "", withDescription description: String = "") {
        errorType = type
        errorCode = code
        errorDescription = description
    }
    
    init(withType type: AppErrorType, withError error: Error) {
        errorType = type
        errorCode = String(error.code)
        errorDescription = error.description
    }
    
    func alertMessage() -> String {
        var msg = ""
        switch self.errorType! {
        case .allFieldNotEntered:
            msg = errorAllFieldNotEntered
        case .invalidEmail:
            msg = errorEmailId
        case .invalidPassword:
            msg = errorInvalidPassword
        case .notReachable:
            msg = errorNetwork
        case .apiError:
            msg = errorDescription!
        case .apiFailure:
            msg = errorDescription!
        case .invalidStatusCode:
            msg = errorUnableProcessData
        default:
            msg = ""
        }
        return msg
    }
    
}

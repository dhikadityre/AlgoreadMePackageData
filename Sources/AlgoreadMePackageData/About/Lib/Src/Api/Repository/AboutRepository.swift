//
//  AboutRepository.swift
//  AlgoreadMePackageData
//
//  Created by @algoreadme on 31/07/25.
//

import Foundation

@MainActor
public protocol AboutRepository {
    func postAbout() async throws -> [PostAboutMD]
    func getAboutByPathParam() async throws -> String
    func postAboutTest() async throws -> String
    func postAboutFinalTest() async throws -> String
    func postAboutFinalTestUT() async throws -> String
}

public extension AboutRepository {
    func postAboutTest() async throws -> String {
        return ""
    }
    
    func postAboutFinalTest() async throws -> String {
        throw AboutError.notImplemented
    }
    
    func postAboutFinalTestUT() async throws -> String {
        return "Unit Test"
    }
}

public enum AboutError: Error, Sendable {
    case notImplemented
    case invalidData
    case networkError(Error)
    case serverError(code: Int, message: String)
    case invalidResponse(data: Data?)
    case timeout(duration: TimeInterval)
    case unknown(Error?)
    
    // Computed property
    var errorDescription: String? {
        switch self {
        case .notImplemented:
            return NSLocalizedString("Method not implemented", comment: "Payment error")
        case .invalidData:
            return NSLocalizedString("Invalid data", comment: "Payment error")
        case .networkError(let error):
            return NSLocalizedString("Network error: \(error.localizedDescription)", comment: "Payment error")
        case .serverError(let code, let message):
            return NSLocalizedString("Server error \(code): \(message)", comment: "Payment error")
        case .invalidResponse:
            return NSLocalizedString("Invalid response from server", comment: "Payment error")
        case .timeout:
            return NSLocalizedString("Request timeout", comment: "Payment error")
        case .unknown:
            return NSLocalizedString("Unknown error occurred", comment: "Payment error")
        }
    }
    
    var failureReason: String? {
        switch self {
        case .notImplemented:
            return "The requested method has not been implemented"
        case .invalidData:
            return "The provided bank code is not valid"
        case .networkError:
            return "Network connection failed"
        case .serverError:
            return "Server returned an error"
        case .invalidResponse:
            return "Server response format is invalid"
        case .timeout:
            return "Request took too long to complete"
        case .unknown:
            return "An unexpected error occurred"
        }
    }
}

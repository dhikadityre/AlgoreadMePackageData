//
//  APIResponse.swift
//  AlgoreadMePackageData
//
//  Created by @algoreadme on 10/08/25.
//

import Foundation

public struct BasicAPIResponse<D: Codable & Sendable>: Codable, Sendable {
    public let code: String?
    public let message: String?
    public let data: D?
    public let errors: [DetailResponseError]?
    
    enum CodingKeys: String, CodingKey {
        case code
        case data
        case message
        case errors
    }
}

public struct FullAPIResponse<D: Codable & Sendable, M: Codable & Sendable>: Codable, Sendable {
    public let code: String?
    public let message: String?
    public let data: D?
    public let metadata: M?
    public let errors: [DetailResponseError]?
    
    enum CodingKeys: String, CodingKey {
        case code
        case data
        case message
        case metadata
        case errors
    }
}

public struct MetadataResponse: Codable, Sendable {
    var pagination: Pagination?
    
    enum CodingKeys: String, CodingKey {
        case pagination
    }
}

public struct DetailResponseError: Codable, Sendable {
    var field: String = ""
    var message: String = ""
}



public struct Pagination: Codable, Sendable {
    public var limit: Int
    public var nextPage: Bool
    public var page: Int
    public var prevPage: Bool
    public var total: Int
    
    enum CodingKeys: String, CodingKey {
        case limit
        case nextPage
        case page
        case prevPage
        case total
    }
}

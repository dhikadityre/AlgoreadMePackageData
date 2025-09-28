//
//  PostAboutRBReq.swift
//  AlgoreadMePackageData
//
//  Created by @algoreadme on 31/07/25.
//

import Foundation

struct PostAboutRBReq: Codable {
    let version: Int
    let customerType: String?
    
    init(version: Int, customerType: String? = nil) {
        self.version = version
        self.customerType = customerType
    }
    
    enum CodingKeys: String, CodingKey {
        case version = "version"
        case customerType = "customer_type"
    }
    
    func toJSONData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func toJSONString() throws -> String {
        return String(data: try toJSONData(), encoding: .utf8)!
    }
}

//
//  PostAboutRBReq+FormData.swift
//  AlgoreadMePackageData
//
//  Created by @algoreadme on 31/07/25.
//

import Foundation

extension PostAboutRBReq {
    func toFormData() -> Data {
        var components = URLComponents()
        components.queryItems = []
        
        components.queryItems?.append(
            URLQueryItem(
                name: "version",
                value: customerType
            )
        )
        if let customerType = customerType {
            components.queryItems?.append(
                URLQueryItem(name: "customer_type", value: customerType)
            )
        }
        
        return components.query?.data(using: .utf8) ?? Data()
    }
    
    func toMultipartFormData() -> Data {
        let boundary = "Boundary-\(UUID().uuidString)"
        var body = Data()
        
        /// Add version
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"version\"\r\n\r\n".data(using: .utf8)!)
        body.append("\(version)\r\n".data(using: .utf8)!)
        
        /// Add customer_type
        if let customerType = customerType {
            body.append("--\(boundary)\r\n".data(using: .utf8)!)
            body.append("Content-Disposition: form-data; name=\"customer_type\"\r\n\r\n".data(using: .utf8)!)
            body.append("\(customerType)\r\n".data(using: .utf8)!)
        }
        
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        return body
    }
}


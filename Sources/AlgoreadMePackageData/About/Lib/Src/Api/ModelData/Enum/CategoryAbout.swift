//
//  CategoryAbout.swift
//  AlgoreadMePackageData
//
//  Created by @algoreadme on 31/07/25.
//

public enum CategoryAbout: String, Sendable {
    case personal = "PERSONAL"
    case work = "WORK"
    case application = "APP"
    case unknown = ""
    
    public init(from value: String) {
        self = CategoryAbout(
            rawValue: value.uppercased()
        ) ?? .unknown
    }
}

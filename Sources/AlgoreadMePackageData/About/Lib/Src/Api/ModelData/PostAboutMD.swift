//
//  PostAboutMD.swift
//  AlgoreadMePackageData
//
//  Created by @algoreadme on 31/07/25.
//

public struct PostAboutMD: Equatable, Sendable {
    let id: Int
    let sequence: String
    let imageUrl: String
    let title: String
    let description: String
    let category: CategoryAbout
    
    public static func empty() -> PostAboutMD {
        return .init(
            id: 0,
            sequence: "",
            imageUrl: "",
            title: "",
            description: "",
            category: .unknown
        )
    }
}

//
//  RefreshTokenMD.swift
//  AlgoreadMePackageData
//
//  Created by @algoreadme on 11/08/25.
//

public struct RefreshTokenMD: Equatable {
    let accessToken: String
    let refreshToken: String
    
    public static func empty() -> Self {
        return .init(accessToken: "", refreshToken: "")
    }
}

//
//  RefreshTokenRD.swift
//  AlgoreadMePackageData
//
//  Created by @algoreadme on 11/08/25.
//

public struct RefreshTokenRD: Equatable {
    let phoneNo: String
    let deviceCode: String
    let refreshToken: String
    let adidUserId: String
    let gpsAdidUserId: String
    
    public static func empty() -> Self {
        return .init(
            phoneNo: "",
            deviceCode: "",
            refreshToken: "",
            adidUserId: "",
            gpsAdidUserId: ""
        )
    }
}

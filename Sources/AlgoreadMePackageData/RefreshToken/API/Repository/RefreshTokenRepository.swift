//
//  RefreshTokenRepository.swift
//  AlgoreadMePackageData
//
//  Created by @algoreadme on 11/08/25.
//

public protocol RefreshTokenRepository: Sendable {
    func postRefreshToken(data: RefreshTokenRD) async throws -> RefreshTokenMD
}

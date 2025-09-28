//
//  AboutApiProtocol.swift
//  AlgoreadMePackageData
//
//  Created by @algoreadme on 10/08/25.
//

public protocol AboutApiProtocol: Sendable {
    func postAbout() async throws -> BasicAPIResponse<[PostAboutRes]>
}

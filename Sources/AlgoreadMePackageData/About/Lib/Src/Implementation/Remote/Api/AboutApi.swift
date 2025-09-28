//
//  AboutApi.swift
//  AlgoreadMePackageData
//
//  Created by @algoreadme on 09/08/25.
//

import CoreNetworkNative
import AlgoreadMeCoreLogger
import Foundation

public final class AboutApi: AboutApiProtocol {
    private let api: APIClient
    
    public init(api: APIClient = DefaultAPIClient(
        baseURL: URL(string: "")!,
        visibilityLogger: DefaultAppLoggerVisibility()
    )) {
        self.api = api
    }
    
    public func postAbout() async throws -> BasicAPIResponse<[PostAboutRes]> {
        try await api.get(
            .init(path: "/about/application"),
            responseType: BasicAPIResponse<[PostAboutRes]>.self
        )
    }
    
    public func getAboutByPathParam() async throws -> String {
        ""
    }
}

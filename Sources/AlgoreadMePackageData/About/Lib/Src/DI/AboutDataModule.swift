//
//  AboutDataModule.swift
//  AlgoreadMePackageData
//
//  Created by @algoreadme on 31/07/25.
//

// Logger is optional; use fallback when module unavailable
#if canImport(AlgoreadMeCoreLogger)
import AlgoreadMeCoreLogger
#else
public protocol AppLoggerVisibility {}
public struct DefaultAppLoggerVisibility: AppLoggerVisibility { public init() {} }
#endif
import CoreNetworkNative
import Foundation

public class AboutDataModule {
    public nonisolated(unsafe) static let shared = AboutDataModule()
    public private(set) var aboutRepository: AboutRepository?
    private var tokenStore: TokenStore?
    
    private init() {}
    
    @MainActor
    private func registerAboutApi(
        baseUrl: String,
        visibilityLogger: AppLoggerVisibility
    ) -> AboutApi {
        // Use shared network module to avoid repetitive setup
        let apiClient = AlgoreadMeNetworkModule.shared.makeAPIClient(baseUrl: "https://private-dbde2e-showcaselevelin.apiary-mock.com")
        return AboutApi(api: apiClient)
    }
    
    @MainActor
    public func register(baseUrl: String, visibilityLogger: AppLoggerVisibility = DefaultAppLoggerVisibility(), refreshConfig: RefreshTokenConfig? = nil) {
//        self.aboutRepository = AboutRepositoryImpl(
//            aboutApi: registerAboutApi(
//                baseUrl: baseUrl,
//                visibilityLogger: visibilityLogger
//            )
//        )
       
        self.aboutRepository = AboutRepositoryImpl(
            aboutApi: registerAboutApi(baseUrl: baseUrl, visibilityLogger: visibilityLogger)
        )
    }

    // Seed or update tokens from app side
    @MainActor public func seedTokens(accessToken: String?, refreshToken: String?) {
        AlgoreadMeNetworkModule.shared.seedTokens(accessToken: accessToken, refreshToken: refreshToken)
    }
}

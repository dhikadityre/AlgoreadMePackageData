//
//  AboutRepositoryImpl.swift
//  AlgoreadMePackageData
//
//  Created by @algoreadme on 09/08/25.
//

import Foundation

public final class AboutRepositoryImpl: AboutRepository, @unchecked Sendable {
    private let aboutApi: any AboutApiProtocol
    
    public init(aboutApi: any AboutApiProtocol) {
        self.aboutApi = aboutApi
    }
    
    public func postAbout() async throws -> [PostAboutMD] {
        do {
            let api = aboutApi
            let response: BasicAPIResponse<[PostAboutRes]> = try await api.postAbout()
            guard let data = response.data else { throw AboutError.invalidData }
            return data.map { $0.toMaps() }
        } catch {
            if let aboutError = error as? AboutError { throw aboutError }
            throw AboutError.networkError(error)
        }
    }
    
    public func getAboutByPathParam() async throws -> String {
        ""
    }
    
}

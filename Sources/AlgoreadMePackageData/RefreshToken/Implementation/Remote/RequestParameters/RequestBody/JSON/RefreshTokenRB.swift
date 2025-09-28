//
//  RefreshTokenRB.swift
//  AlgoreadMePackageData
//
//  Created by @algoreadme on 11/08/25.
//

import Foundation

public struct RefreshTokenRB: Codable {
    let phoneNo: String?
    let deviceCode: String
    let refreshToken: String
    let adid: String?
    let gpsAdid: String?
    
    public init(
        phoneNo: String?,
        deviceCode: String,
        refreshToken: String,
        adid: String?,
        gpsAdid: String?
    ) {
        self.phoneNo = phoneNo
        self.deviceCode = deviceCode
        self.refreshToken = refreshToken
        self.adid = adid
        self.gpsAdid = gpsAdid
    }
    
    enum CodingKeys: String, CodingKey {
        case phoneNo = "phone_no"
        case deviceCode = "device_code"
        case refreshToken = "refresh_token"
        case adid = "adid"
        case gpsAdid = "gps_adid"
    }
    
    func toJSONData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func toJSONString() throws -> String {
        return String(data: try toJSONData(), encoding: .utf8)!
    }
}

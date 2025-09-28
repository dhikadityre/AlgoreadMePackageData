//
//  PostAboutRBMapper.swift
//  AlgoreadMePackageData
//
//  Created by @algoreadme on 31/07/25.
//

struct PostAboutRBMapper: Mapper {
    typealias Input = PostAboutRB
    typealias Output = PostAboutRBReq
    
    func map(_ input: PostAboutRB) -> PostAboutRBReq {
        return PostAboutRBReq(
            version: input.version,
            customerType: input.customerType.rawValue
        )
    }
}

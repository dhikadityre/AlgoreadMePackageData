//
//  Mapper.swift
//  AlgoreadMePackageData
//
//  Created by @algoreadme on 31/07/25.
//

protocol Mapper {
    associatedtype Input
    associatedtype Output
    
    func map(_ input: Input) -> Output
}

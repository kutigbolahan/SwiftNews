//
//  ResultState.swift
//  Swiftnews
//
//  Created by GB on 8/24/22.
//

import Foundation
//
//
//enum ResultState{
//    case loading
//    case success(content:[Article])
//    case failed (error: Error)
//}

enum ResultState: Equatable {
   
    
    case loading
    case success(content:[Article])
    case failed (error: Error)
    static func == (lhs: ResultState, rhs: ResultState) -> Bool {
        switch (lhs, rhs){
        case(.loading, .loading):
            return true
        case(.failed(error: let lhsType), .failed(error: let rhsType)):
            return lhsType.localizedDescription == rhsType.localizedDescription
        case(.success(content: let lhsType), .success(content: let rhsType)):
            return lhsType == rhsType
        default:
            return false
        }
    }
}

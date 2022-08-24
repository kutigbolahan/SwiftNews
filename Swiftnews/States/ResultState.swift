//
//  ResultState.swift
//  Swiftnews
//
//  Created by GB on 8/24/22.
//

import Foundation


enum ResultState{
    case loading
    case success(content:[Article])
    case failed (error: Error)
}

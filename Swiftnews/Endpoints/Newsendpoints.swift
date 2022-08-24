//
//  Newsendpoints.swift
//  Swiftnews
//
//  Created by GB on 8/23/22.
//

import Foundation


protocol Apibuilder{
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum NewsApi{
    case getNews
}


extension NewsApi: Apibuilder {
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
    
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        return "/news"
    }
    
    
}

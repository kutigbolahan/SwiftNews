//
//  NewsService.swift
//  Swiftnews
//
//  Created by GB on 8/24/22.
//

import Foundation
import Combine

protocol NewsService {
    func request(from endpoint: NewsApi) -> AnyPublisher<NewsResponse, ApiError>
        }

struct NewsServiceImpl: NewsService{
    func request(from endpoint: NewsApi) -> AnyPublisher<NewsResponse, ApiError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{ _ in ApiError.unknown}
            .flatMap{data, response -> AnyPublisher<NewsResponse, ApiError> in
                
                guard let response = response as? HTTPURLResponse else{
                    return Fail(error: ApiError.unknown).eraseToAnyPublisher()
                }
                if(200...299).contains(response.statusCode){
                  let jsonDecoder = JSONDecoder()
                  jsonDecoder.dateDecodingStrategy = .iso8601
//                    //decode Object
               return   Just(data)
                       .decode(type: NewsResponse.self, decoder:jsonDecoder)
                       .mapError { _ in ApiError.decodingError }
                       .eraseToAnyPublisher()
                    
                } else {
                    return Fail(error: ApiError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
                
                     
            }
            .eraseToAnyPublisher()
    }
    
    
}

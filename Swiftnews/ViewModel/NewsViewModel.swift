//
//  NewsViewModel.swift
//  Swiftnews
//
//  Created by GB on 8/24/22.
//

import Foundation
import Combine
import SwiftUI

protocol NewsViewModel{
    func getArticles()
    var isLoading: Bool {get}
}



class NewsViewModelImpl: ObservableObject, NewsViewModel {
   
    
    private let service : NewsService
    private(set) var articles = [Article]()
    @Published private(set) var state: ResultState = .loading
    private var cancellables = Set<AnyCancellable>()
    var isLoading: Bool{
        state == .loading
    }
    
 
    init(service: NewsService){
        self.service = service
    }
    func getArticles(){
        self.state = .loading
        let cancellable = service.request(from: .getNews).sink{
            res in
            switch res{
                
            case .finished:
                //send back the articles
                self.state = .success(content: self.articles)
                break
            case .failure(let error):
                // send back the error
                self.state = .failed(error: error)
                break
            }
        } receiveValue: { response in
            self.articles = response.articles
        }
        self.cancellables.insert(cancellable)
    }
}

//
//  FeedsView.swift
//  Swiftnews
//
//  Created by GB on 8/28/22.
//

import SwiftUI
import Combine

struct FeedsView: View {
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    var body: some View {
        NavigationView{
            Group{
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .failed(let error):
                    ErrorView(error: error, handler: viewModel.getArticles)
                case .success(let articles):
                 
                        List(articles){
                            item in
                            ArticleView(article: item).onTapGesture {
                                loadUrl(url: item.url)
                            }
                        }
                        .navigationTitle(Text("News"))
                     
                }
                
            }
        }
        
      .onAppear(perform: viewModel.getArticles)
    }
    func loadUrl(url: String?) {
        guard let link = url,
                let url = URL(string: link) else{ return }
        openUrl(url)
    }
}

struct FeedsView_Previews: PreviewProvider {
    static var previews: some View {
        FeedsView()
    }
}

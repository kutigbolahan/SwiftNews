//
//  ArticleView.swift
//  Swiftnews
//
//  Created by GB on 8/24/22.
//

import SwiftUI
import URLImage




//using optional chanining: to see if we should use the url to display an image or use a place holder
struct ArticleView: View {
    let article : Article
    
    var body: some View {
        HStack{
            if let imgUrl = article.image,
               let url = URL(string: imgUrl){
                URLImage(url,

                         failure: { error, _ in
                   
                    PlaceHolderImageView()
                },
                         content: {
                    image in
                    image.resizable().aspectRatio(contentMode: .fill)
                }).frame(width: 100, height: 100).cornerRadius(10)
            }else{
                PlaceHolderImageView()
            }
            VStack(alignment: .leading, spacing: 4 ){
                Text(article.title ?? " ").foregroundColor(.black).font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "N/A").foregroundColor(.gray).font(.footnote)
              
            }
        }
    }
}

    struct PlaceHolderImageView: View{
        var body: some View{
            Image(systemName: "photo.fill").foregroundColor(.white).background(Color.gray).frame(width: 100, height: 100)
        }
    }

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData).previewLayout(.sizeThatFits)
    }
}

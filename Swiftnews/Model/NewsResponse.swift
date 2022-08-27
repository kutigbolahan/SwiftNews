//
//  NewsResponse.swift
//  Swiftnews
//
//  Created by GB on 8/23/22.
//

import Foundation


// MARK: - NewsResponse
struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable,Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article{
    static var dummyData: Article {
        .init(author: "John Wagner, Mariana Alfaro",
              url: "https://www.washingtonpost.com/politics/2022/08/24/biden-student-debt-ukraine-aid/",
              source: "The Washington Post",
              title: "Post Politics Now: Biden returning to Washington with news on Ukraine aid, possibly student debt - The Washington Post",
              articleDescription: "The president is scheduled to be back at the White House on Wednesday after vacationing in Delaware. His administration is expected to make news on domestic and international issues.",
              image: "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/ZP5THMAXM4I63OMYWKVWR5MENA.jpg&w=1440",
              date: Date())
    }
}

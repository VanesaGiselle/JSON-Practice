//
//  NewsFeed.swift
//  JsonPractice
//
//  Created by Vanesa Korbenfeld on 28/10/2021.
//

import Foundation

struct NewsFeed: Codable {
    var status:String = ""
    var totalResults:Int = 0
    var articles: [Article]
}

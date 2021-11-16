//
//  Category.swift
//  Natics
//
//  Created by Farrel Anshary on 15/11/21.
//

import Foundation

struct Category: Codable {
    var id: Int
    var name: String
    var newCount: Int?
    var oldCount: Int?
    var newsCount: Int?
}

extension Category {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case newCount = "new_count"
        case oldCount = "old_count"
        case newsCount = "news_count"
    }
}

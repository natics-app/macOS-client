//
//  CasesCategories.swift
//  Natics
//
//  Created by Peter Lee on 16/11/21.
//

import Foundation

struct CasesCategoriesGetResponse: Codable {
    var total: Int
    var selected_start: String
    var selected_end: String
    var labels: [CasesCategoriesModel]
}

struct CasesCategoriesModel: Codable {
    var name: String
    var news_count: Int
}

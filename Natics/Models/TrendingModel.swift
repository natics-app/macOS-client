//
//  TrendingModel.swift
//  Natics
//
//  Created by Jackie Leonardy on 15/11/21.
//

import Foundation

// Parent object for Trending Province response
struct TrendingProvinceGetResponse: Codable {
    var total: Int
    var selected_start: String
    var selected_end: String
    var provinces: [ProvinceTrendingModel]
}

struct ProvinceTrendingModel: Codable {
    var id: Int
    var name: String
    var latitude: Float
    var longitude: Float
    var news_count: Int
}

struct TrendingAnimalGetResponse: Codable {
    var total: Int
    var selected_start: String
    var selected_end: String
    var categories: [CategoriesTrendingModel]
}

struct CategoriesTrendingModel: Codable {
    var id: Int
    var name: String
    var news_count: Int
}

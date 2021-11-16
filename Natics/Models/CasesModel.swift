//
//  CasesModel.swift
//  Natics
//
//  Created by Christian Adiputra on 15/11/21.
//

import Foundation

struct CasesGetResponse: Codable {
    var total: Int
    var selected_start: String
    var selected_end: String
    var news: [NewsModel]
}

struct NewsModel: Codable {
    var id: Int
    var title: String
    var url: String
    var date: String?
    var news_date: String
    var is_trained: Int
    var label: String
    var organizations: [OrganizationModel]
    var site: SiteModel?
    var animals: [AnimalModel]
    var regencies: [RegencyModel]
}

struct OrganizationModel: Codable {
    var id: Int
    var name: String
}

struct SiteModel: Codable {
    var id: Int
    var name: String
}

struct AnimalModel: Codable {
    var id: Int
    var name: String
    var scientific_name: String?
    var amount: Int?
    var category: AnimalCategoryModel
}

struct AnimalCategoryModel: Codable {
    var id: Int
    var name: String
}

struct RegencyModel: Codable {
    var id: Int
    var name: String
    var province: ProvinceModel
}

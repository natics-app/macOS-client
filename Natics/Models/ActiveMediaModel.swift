//
//  ActiveMediaModel.swift
//  Natics
//
//  Created by Peter Lee on 16/11/21.
//

import Foundation

struct ActiveMediaGetResponse: Codable {
    var total: Int
    var selected_start: String
    var selected_end: String
    var sites: [ActiveMediaModel]
}

struct ActiveMediaModel: Codable {
    var id: Int
    var name: String
    var news_count: Int
}

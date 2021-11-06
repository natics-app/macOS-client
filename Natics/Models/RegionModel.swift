//
//  RegionModel.swift
//  Natics
//
//  Created by Puras Handharmahua on 04/11/21.
//

import Foundation

// Parent object for region response
struct RegionGetResponse: Codable {
    var provinces: [ProvinceModel]
}

// Child object for region response
struct ProvinceModel: Codable {
    var id: Int
    var name: String
    var latitude: Float
    var longitude: Float
}

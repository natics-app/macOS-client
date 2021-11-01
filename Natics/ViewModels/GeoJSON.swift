//
//  GeoJSON.swift
//  add-a-point-line-and-polygon
//
//  Created by Jackie Leonardy on 26/10/21.
//  Copyright © 2021 Esri. All rights reserved.
//


import Foundation

//// MARK: - GeoJSON
//struct GeoJSONData {
//    static let shared = GeoJSONData()
//    var geoJSON : GeoJSON?
//
//    private init() { }
//}

// MARK: - GeoJSON
struct GeoJSON: Codable {
    let type: String
    var features: [Feature]
}

// MARK: - Feature
struct Feature: Codable {
    let type: String
    let geometry: Geometry
    let id: Int?
    let properties: Properties
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: String
    let coordinates: [[[Double]]]
}

// MARK: - Properties
struct Properties: Codable {
    let id, kode: Int
    let propinsi: String
    let sumber: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case kode
        case propinsi = "Propinsi"
        case sumber = "SUMBER"
    }
}

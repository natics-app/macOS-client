//
//  HeatMapModel.swift
//  MacOSMap
//
//  Created by Jackie Leonardy on 27/10/21.
//

import Foundation
import CoreLocation

struct PolygonInfo: Codable {
    let id, kode, jumlah: Int
    let latitude, longitude: Double
    let propinsi: String
    let sumber: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case kode
        case propinsi = "Propinsi"
        case sumber = "SUMBER"
        case jumlah = "Jumlah"
        case latitude = "latitude"
        case longitude = "longitude"
    }
}

class overlayer {
    static var shared = overlayer(polygonInfo: PolygonInfo(id: 1, kode: 2, jumlah: 0, latitude: 0, longitude: 0, propinsi: "1", sumber: "2"))
    
    init(polygonInfo: PolygonInfo){
        self.polygonInfo = polygonInfo
    }
    
    var polygonInfo : PolygonInfo
    
    func changePolygon(newPolygon: PolygonInfo){
        self.polygonInfo = newPolygon
    }
}


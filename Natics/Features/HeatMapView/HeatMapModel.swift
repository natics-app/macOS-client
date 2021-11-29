import Foundation
import CoreLocation
import MapKit

struct PolygonInfo: Codable {
    var id, kode, jumlah: Int
    let latitude, longitude: Double
    let propinsi: String
    let sumber: String
    var isIntersect: Bool = false

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case kode = "kode"
        case propinsi = "Propinsi"
        case sumber = "SUMBER"
        case jumlah = "Jumlah"
        case latitude = "latitude"
        case longitude = "longitude"
    }
}

struct MapOverlayer {
    var overlay : MKOverlay
    var polygonInfo : PolygonInfo
    var isHover : Bool
}

class MapOverlays {
    private var overlayList = [MapOverlayer]()
    private var overlayTempList = [MKOverlay]()
    
    static var shared = MapOverlays()
    
    func addOverlay(mapOverlayer: MapOverlayer) {
        MapOverlays.shared.overlayList.append(mapOverlayer)
    }
    
    func addTempOverlay(mapOverlayer: MKOverlay) {
        MapOverlays.shared.overlayTempList.append(mapOverlayer)
    }
    
    func returnOverlayList() -> [MapOverlayer] {
        return MapOverlays.shared.overlayList
    }
    
    func returnTempOverlay() -> [MKOverlay] {
        return MapOverlays.shared.overlayTempList
    }
    
    func emptyOverlay() {
        MapOverlays.shared.overlayTempList.removeAll()
    }
    
    func emptyOverlay(to index: Int) {
        if returnTempOverlay().count > 1 {
            MapOverlays.shared.overlayTempList.removeFirst(index)
        }
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

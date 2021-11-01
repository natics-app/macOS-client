//
//  HeatMapViewModel.swift
//  MacOSMap
//
//  Created by Jackie Leonardy on 27/10/21.
//

import SwiftUI
import MapKit


struct MapCompat : NSViewRepresentable {
    @Binding var coordinateRegion : MKCoordinateRegion
    
    let lineCoordinates: [CLLocationCoordinate2D]
    let mapView = MKMapView()
    
    
    func makeNSView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator
        mapView.region = coordinateRegion
        
        loadGeoJson()
    
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 5500000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        
        return mapView
    }
    
    private func configureTileOverlay() {
            guard let overlayFileURLString = Bundle.main.path(forResource: "GoogleStyle", ofType: "json") else {
                    return
            }
        
        let overlay = MKTileOverlay.init(urlTemplate: overlayFileURLString)
                overlay.isGeometryFlipped = false
                overlay.canReplaceMapContent = true
        mapView.addOverlay(overlay, level: MKOverlayLevel.aboveLabels)

    }
    
    
    func updateNSView(_ view: MKMapView, context: Context) {
        DispatchQueue.main.async {
            view.region = coordinateRegion
        }
    }
    
//    func writeToFile(location: URL) {
//            do{
//                let encoder = JSONEncoder()
//                encoder.outputFormatting = .prettyPrinted
//                let JsonData = try encoder.encode(athleteList)
//                try JsonData.write(to: location)
//            }catch{}
//        }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func loadGeoJson(){
        guard let url = Bundle.main.url(forResource: "IndonesiaGeoJSONProvinces", withExtension: "geojson") else {
            fatalError("unable to get geojson")
        }
        var geoJson = [MKGeoJSONObject]()
        do {
            let data = try Data(contentsOf: url)
            geoJson = try MKGeoJSONDecoder().decode(data)
        } catch {
            fatalError("Unable to decode JSON")
        }
        
        var overlays = [MKOverlay]()
        for item in geoJson {
            if let feature = item as? MKGeoJSONFeature {
                let geometry = feature.geometry.first
                let propData = feature.properties!
                
                if let polygon = geometry as? MKPolygon {
                    let polygonInfo = try? JSONDecoder.init().decode(PolygonInfo.self, from: propData)
                    self.render(overlay: polygon, info: polygonInfo)
                }
                
                for geo in feature.geometry {
                    if let polygon = geo as? MKPolygon {
                        overlays.append(polygon)
                    }
                }
            }
        }
    }
    
//    private func readLocalFile(forName name: String) {
//        var featureData : [Feature] = [Feature]()
//        do {
//            if let bundlePath = Bundle.main.path(forResource: name,
//                                                 ofType: "geojson"),
//                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
//                let json = try JSON(data: jsonData)
//                guard let records = json["features"].array
//                    else { return }
//                for record in records {
//                    
//                    let propertiesRecord = record["properties"]
//                    let geometryRecord = record["geometry"]
//                    let coordinateRecords = geometryRecord["coordinates"].arrayObject
//                    let idRecord = record["id"].intValue
//                    
//                    let coordinateArray:[[[Any]]] = coordinateRecords.flatMap { $0 } as! [[[Any]]]
//                    
//                    var coordinatingArray = [[[Double]]]()
//                    
//                    for coordinateArrays in coordinateArray {
//                        if let downcastStrings = coordinateArrays as? [[Double]] {
//                            coordinatingArray.append(downcastStrings)
//                        }
//                    }
//                    
//                    let geometry = Geometry(type: "data", coordinates: coordinatingArray)
//                    let property = Properties(id: propertiesRecord["ID"].intValue, kode: propertiesRecord["kode"].intValue, propinsi: propertiesRecord["Propinsi"].stringValue, sumber: propertiesRecord["SUMBER"].stringValue)
//
//
//                    let geoJSONFeature = Feature(type: record["type"].stringValue, geometry: geometry, id: idRecord, properties: property)
//                    
//                    featureData.append(geoJSONFeature)
//                    for coordinates in geoJSONFeature.geometry.coordinates {
//                        print(coordinates.first!)
//                    }
//                }
//            }
//        } catch {
//            print(error)
//        }
//    }
    
    class Coordinator : NSObject, MKMapViewDelegate {
        var parent : MapCompat
        
        init(_ parent: MapCompat) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            DispatchQueue.main.async {
                self.parent.coordinateRegion = mapView.region
            }
        }
        
        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
                if annotation is MKUserLocation { return nil }

                let reuseIdentifier = "..."

                var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)

                if annotationView == nil {
                    annotationView = CustomAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
                } else {
                    annotationView?.annotation = annotation
                }

                return annotationView
            }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polygon = overlay as? MKPolygon {
                
                let renderer = MKPolygonRenderer(polygon: polygon)
                
                if overlayer.shared.polygonInfo.jumlah == 0 {
                    renderer.fillColor = NSColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 0.5)
                }
                else if overlayer.shared.polygonInfo.jumlah > 0 && overlayer.shared.polygonInfo.jumlah < 100 {
                    renderer.fillColor = NSColor(red: 255/255, green: 215/255, blue: 0/255, alpha: 0.5)
                }
                
                else if overlayer.shared.polygonInfo.jumlah > 99 && overlayer.shared.polygonInfo.jumlah < 300 {
                    renderer.fillColor = NSColor(red: 255/255, green: 174/255, blue: 66/255, alpha: 0.5)
                }
                
                else {
                    renderer.fillColor = NSColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.5)
                }
                renderer.strokeColor = NSColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 0.3)
                renderer.lineWidth = 1
                
                let annotation = MKPointAnnotation()
                let provinceCoordinate = CLLocationCoordinate2D(latitude: overlayer.shared.polygonInfo.latitude, longitude: overlayer.shared.polygonInfo.longitude)
                
                annotation.coordinate = provinceCoordinate
                annotation.title = "\(overlayer.shared.polygonInfo.propinsi): \(overlayer.shared.polygonInfo.jumlah) kasus"
                mapView.addAnnotation(annotation)
                
                print("Rendering \(overlayer.shared.polygonInfo.propinsi)")
                
                return renderer
            }
            
            if let tileOverlay = overlay as? MKTileOverlay {
               return MKTileOverlayRenderer(tileOverlay: tileOverlay)
           } else {
               return MKOverlayRenderer(overlay: overlay)
           }
        }
    }
    
    class CustomAnnotationView: MKPinAnnotationView {  // or nowadays, you might use MKMarkerAnnotationView
        override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
            super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)

            canShowCallout = true
//            let button = NSButton(frame: NSRect(x: 0, y: 0, width: 30, height: 35))
//                   button.title =  "A button in code"
//            button.target = self
//            rightCalloutAccessoryView = button
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
    }
    
    
    func makeCallout(namaProvinsi: String, jumlah: Int){
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinateRegion.center
        annotation.title = "\(namaProvinsi): \(jumlah) kasus"
        mapView.addAnnotation(annotation)
    }
    
    func render(overlay: MKOverlay, info: Any?) {
        if let polygonInfo = info as? PolygonInfo {
            overlayer.shared.changePolygon(newPolygon: polygonInfo)
        }
        self.mapView.addOverlay(overlay)
    }
    
}

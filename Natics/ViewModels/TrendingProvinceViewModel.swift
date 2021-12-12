//
//  TrendingProvinceViewModel.swift
//  Natics
//
//  Created by Jackie Leonardy on 15/11/21.
//

import Foundation
import SwiftUI
import Combine
import Charts
import MapKit

class TrendingProvinceViewModel: ObservableObject {
    // MARK: Published Properties
    @Published var provincesAllTrending: [ProvinceTrendingModel] = []
    @Published var provincesTopTrending: [ProvinceTrendingModel] = [] {
        didSet {
            setProvinceTrending()
        }
    }
    @Published var locationList = [BarChartDataEntry]()
    @Published var locationNames = [String]()
    @Published var isDataLoaded = false
    
    // MARK: Private Properties
    private let request = TrendingRequest()
    private var cancellable = Set<AnyCancellable>()
    private var snapshotter: MKMapSnapshotter? = MKMapSnapshotter()
    
    @Published var isIntersect = false
    
    init() {
        setProvinceTrending()
    }
    
    // MARK: Public Methods
    func getTrendingProvinces(selected: DatePickerModel) {
        request.getTrendingProvince(startDate: selected.getStartDate(), endDate: selected.getEndDate())
            .receive(on: RunLoop.main)
            .sink { result in
                switch result {
                    case .failure(let err):
                        print(err.message!)
                    case .finished:
                        print("Finish")
                        self.isDataLoaded = true
                }
                
            } receiveValue: { [weak self] (trendingProvince) in
                self?.provincesAllTrending = trendingProvince.data!.provinces
                
                let arraySlice = trendingProvince.data!.provinces.prefix(8)
                self?.provincesTopTrending = Array(arraySlice)
            }
            .store(in: &cancellable)
    }
    
    func getTrendingProvinces(startDate: String, endDate: String) {
        request.getTrendingProvince(startDate: startDate, endDate: endDate)
            .receive(on: RunLoop.main)
            .sink { result in
                switch result {
                    case .failure(let err):
                        print(err.message!)
                    case .finished:
                        print("Finish")
                        self.isDataLoaded = true
                }
                
            } receiveValue: { [weak self] (trendingProvince) in
                self?.provincesAllTrending = trendingProvince.data!.provinces
                
                let arraySlice = trendingProvince.data!.provinces.prefix(8)
                self?.provincesTopTrending = Array(arraySlice)
            }
            .store(in: &cancellable)
    }
}

extension TrendingProvinceViewModel {
    
    func setProvinceTrending() {
        
        self.locationNames = provincesTopTrending.map { trend in
            trend.name
        }
        
        self.locationNames = self.locationNames.reversed()
        
        self.locationList = provincesTopTrending.reversed().enumerated().map { (index, element) in
            return BarChartDataEntry(x: Double(index), y: Double(element.news_count))
        }
        
    }
    
    func takeSnapshot(_ mapView: MapCompat) -> NSImage {
            snapshotter?.cancel()
            let mapData =  mapView.mapView
        
            let options = MKMapSnapshotter.Options()

            options.camera = MKMapCamera(lookingAtCenter: mapData.region.center, fromDistance: 1000, pitch: 0, heading: 0)
            options.mapType = .satellite
            options.size = mapData.frame.size

            let snapshotter = MKMapSnapshotter(options: options)
            var mapImage : NSImage? = nil
        
            snapshotter.start { snapshot, _ in
                mapImage = snapshot?.image
            }
        
            return mapImage!
    }
}

//
//  TrendingProvinceViewModel.swift
//  Natics
//
//  Created by Jackie Leonardy on 15/11/21.
//

import Foundation
import SwiftUI
import Combine

class TrendingProvinceViewModel: ObservableObject {
    // MARK: Published Properties
    @Published var provincesAllTrending: [ProvinceTrendingModel] = []
    @Published var provincesTopTrending: [ProvinceTrendingModel] = []
    @Published var isDataLoaded = false
    // MARK: Private Properties
    private let request = TrendingProvinceRequest()
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: Public Methods
    func getTreningProvinces() {
        request.getTrendingProvince()
            .receive(on: RunLoop.main)
            .sink { result in
                print(result)
            } receiveValue: { [weak self] (trendingProvince) in
                self?.provincesAllTrending = trendingProvince.data!.provinces
                self?.isDataLoaded = true
                
                let arraySlice = trendingProvince.data!.provinces.prefix(8)
                self?.provincesTopTrending = Array(arraySlice)
                
                print(self!.provincesTopTrending)
            }
            .store(in: &cancellable)
    }
}

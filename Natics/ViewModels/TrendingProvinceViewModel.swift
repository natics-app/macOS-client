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
    @Published var provinces: [ProvinceTrendingModel] = []
    
    // MARK: Private Properties
    private let request = TrendingProvinceRequest()
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: Public Methods
    func getAllProvinces() {

    }
}

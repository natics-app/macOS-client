//
//  ContohViewModel.swift
//  Natics
//
//  Created by Puras Handharmahua on 11/11/21.
//

import Foundation
import SwiftUI
import Combine

class ContohViewModel: ObservableObject {
    // MARK: Published Properties
    @Published var provinces: [ProvinceModel] = []
    
    // MARK: Private Properties
    private let request = RegionRequest()
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: Public Methods
    func getAllProvinces() {

    }
}

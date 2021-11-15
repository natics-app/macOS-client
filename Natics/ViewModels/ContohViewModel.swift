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
    private let regionRequest = RegionRequest()
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: Public Methods
    func getAllProvinces() {
        regionRequest.getAllProvince()
            .sink { result in
                switch result {
                case .failure(let err):
                    print(err.message!)
                case .finished:
                    print("Finish")
                }
            } receiveValue: { response in
                guard let data = response.data else {return}
                self.provinces = data.provinces
            }
            .store(in: &cancellable)
    }
}

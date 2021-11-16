//
//  TrendingRisingCaseViewModel.swift
//  Natics
//
//  Created by Jackie Leonardy on 16/11/21.
//

import Foundation
import SwiftUI
import Combine

class TrendingRisingCaseViewModel: ObservableObject {
    @Published var risingCasesAllTrending : [RisingCategoriesModel] = []
    @Published var risingCasesTopTrending : [RisingCategoriesModel] = []
    
    private let request = TrendingRequest()
    private var cancellable = Set<AnyCancellable>()
    
    func getTrendingRisingCases(selection: DatePickerModel) {
        request.getTrendingRisingCases(startDate: selection.getStartDate(), endDate: selection.getEndDate())
            .receive(on: RunLoop.main)
            .sink { result in
                switch result {
                    case .failure(let err):
                        print(err)
                    case .finished:
                        print("Get Trending Cases finish")
                }
            } receiveValue: { [weak self] (trendingRisingCases) in
                self?.risingCasesAllTrending = trendingRisingCases.data!.categories
                let arraySlice = trendingRisingCases.data!.categories.prefix(8)
                self?.risingCasesTopTrending = Array(arraySlice)
                print(self?.risingCasesTopTrending)
            }
            .store(in: &cancellable)
    }
}

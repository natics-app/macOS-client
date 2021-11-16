//
//  ActiveMediaViewModel.swift
//  Natics
//
//  Created by Peter Lee on 16/11/21.
//

import Foundation
import SwiftUI
import Combine
import Charts

class ActiveMediaViewModel: ObservableObject {
    @Published var activeMedia: [ActiveMediaModel] = [] {
        didSet {
            setActiveMedia()
        }
    }
    
    @Published var activeMediaList = [BarChartDataEntry]()
    @Published var activeMediaNames = [String]()
    
    private let activeMediaRequest = SitesRequest()
    private var cancellable = Set<AnyCancellable>()
    
    func getActiveMedia(selected: DatePickerModel) {
        activeMediaRequest.getActiveMedia(startDate: selected.getStartDate(), endDate: selected.getEndDate())
            .receive(on: RunLoop.main)
            .sink { result in
                switch result {
                case .failure(let err):
                    print("Active Media: \(err.message!)")
                case .finished:
                    print("Finish")
                }
            } receiveValue: { result in
                guard let data = result.data else {return}
                self.activeMedia = data.sites
                print(self.activeMedia)
            }
            .store(in: &cancellable)
    }
}

extension ActiveMediaViewModel {
    func setActiveMedia() {
        self.activeMediaNames = activeMedia.reversed().map {
            active in
            active.name
        }
        
        self.activeMediaList = activeMedia.reversed().enumerated().map {
            (index, element) in
            return BarChartDataEntry(x: Double(index-1), y: Double(element.news_count))
        }
    }
}

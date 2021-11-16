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
    
    @Published var activeMedia: [ActiveMediaModel] = []
    
    @Published var activeTopMedia: [ActiveMediaModel] = [] {
        didSet {
            setActiveMedia()
        }
    }
    
    @Published var activeMediaList = [PieChartDataEntry]()
    @Published var activeMediaNames = [String]()
    
    private let activeMediaRequest = SitesRequest()
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setActiveMedia()
    }
    
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
                self.activeMedia = result.data!.sites
                let arraySlice = result.data!.sites.prefix(5)
                self.activeTopMedia = Array(arraySlice)
                print(self.activeMedia)
            }
            .store(in: &cancellable)
    }
    
    func getActiveMedia(startDate: String, endDate: String) {
        activeMediaRequest.getActiveMedia(startDate: startDate, endDate: endDate)
            .receive(on: RunLoop.main)
            .sink { result in
                switch result {
                case .failure(let err):
                    print("Active Media: \(err.message!)")
                case .finished:
                    print("Finish")
                }
            } receiveValue: { result in
                self.activeMedia = result.data!.sites
                let arraySlice = result.data!.sites.prefix(5)
                self.activeTopMedia = Array(arraySlice)
                print(self.activeMedia)
            }
            .store(in: &cancellable)
    }
}

extension ActiveMediaViewModel {
    func setActiveMedia() {
        self.activeMediaNames = activeTopMedia.map {
            active in
            active.name
        }
        
        var total = 0
        for i in activeTopMedia {
            total += i.news_count
        }
        
        print("Debug total \(total)")
        
        self.activeMediaList = activeTopMedia.enumerated().map {
            (index, element) in
            
            var percentage = 0
            
            if total == 0 {
                percentage = 0
            } else {
                percentage = (element.news_count*100)/total
            }
            print("Debug percent: \(percentage)")
            return PieChartDataEntry(value: Double(element.news_count), label: "\(percentage)% - \(element.name)")
        }
    }
}

//
//  CasesCategoriesViewModel.swift
//  Natics
//
//  Created by Peter Lee on 16/11/21.
//

import Foundation
import SwiftUI
import Combine
import Charts

class CasesCategoriesViewModel: ObservableObject {
    @Published var casesCategories: [CasesCategoriesModel] = []
    
    @Published var casesTopCategories: [CasesCategoriesModel] = [] {
        didSet {
            setCasesCategories()
        }
    }
    
    @Published var casesCategoriesList = [PieChartDataEntry]()
    @Published var casesCategoriesNames = [String]()
    
    private let casesCategoriesRequest = CasesCategoriesRequest()
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setCasesCategories()
    }
    
    func getCasesCategories(selected: DatePickerModel) {
        print("Debug cases: \(selected.getStartDate())")

        casesCategoriesRequest.getCasesCategories(startDate: selected.getStartDate(), endDate: selected.getEndDate())
            .receive(on: RunLoop.main)
            .sink { result in
                switch result {
                case .failure(let err):
                    print(err.message!)
                case .finished:
                    print("Finish")
                }
            } receiveValue: { result in
                self.casesCategories = result.data!.labels
                let arraySlice = result.data!.labels.prefix(5)
                self.casesTopCategories = Array(arraySlice)
            }
            .store(in: &cancellable)
    }
    
    func getCasesCategories(startDate: String, endDate: String) {
        casesCategoriesRequest.getCasesCategories(startDate: startDate, endDate: endDate)
            .receive(on: RunLoop.main)
            .sink { result in
                switch result {
                case .failure(let err):
                    print(err.message!)
                case .finished:
                    print("Finish")
                }
            } receiveValue: { result in
                self.casesCategories = result.data!.labels
                let arraySlice = result.data!.labels.prefix(5)
                self.casesTopCategories = Array(arraySlice)
            }
            .store(in: &cancellable)
    }
}

extension CasesCategoriesViewModel {
    func setCasesCategories() {
        self.casesCategoriesNames = casesTopCategories.map {
            cases in
            cases.name
        }
        
        var total = 0
        for i in casesTopCategories {
            total += i.news_count
        }
        
        self.casesCategoriesList = casesTopCategories.enumerated().map {
            (index, element) in
            var percentage = 0
            
            if total == 0 {
                percentage = 0
            } else {
                percentage = (element.news_count*100)/total
            }
            return PieChartDataEntry(value: Double(element.news_count), label: "\(percentage)% - \(element.name)")
        }
    }
}

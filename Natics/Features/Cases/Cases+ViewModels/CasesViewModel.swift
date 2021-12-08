//
//  CasesViewModel.swift
//  Natics
//
//  Created by Christian Adiputra on 15/11/21.
//

import Foundation
import SwiftUI
import Combine


class CasesViewModel: ObservableObject {
    
    // MARK: Published Properties
    @Published var cases: [NewsModel] = [] {
        didSet {
            generateCSVContent()
        }
    }
    @Published var doneLoading: Bool = false
    @Published var csvContent = ""
    
    private let casesRequest = CasesRequest()
    private var cancellable = Set<AnyCancellable>()
    
    func getAllCases(selection: DatePickerModel) {
        doneLoading = false
        casesRequest.getAllCases(startDate: selection.getStartDate(), endDate: selection.getEndDate())
            .receive(on: DispatchQueue.main, options: nil)
            .sink { result in
                switch result {
                case .failure(let err):
                    print(err.message!)
                case .finished:
                    print("Finish")
                }
            } receiveValue: { [weak self] response in
                guard let data = response.data else {return}
                self?.cases = data.news
                self?.doneLoading = true
            }
            .store(in: &cancellable)
    }
    
    func getAllCases(startDate: String, endDate: String) {
        doneLoading = false
        casesRequest.getAllCases(startDate: startDate, endDate: endDate)
            .receive(on: DispatchQueue.main, options: nil)
            .sink { result in
                switch result {
                case .failure(let err):
                    print(err.message!)
                case .finished:
                    print("Finish")
                }
            } receiveValue: { [weak self] response in
                guard let data = response.data else {return}
                self?.cases = data.news
                self?.doneLoading = true
            }
            .store(in: &cancellable)
    }
}

extension CasesViewModel {
    // MARK: - Generate CSV String
    func generateCSVContent() {
        var csvHead = "No,News Title,News Date,Animal Name,Location 1,Location 2,Organization,Cases Date,Cases Categories,Media Name,Link\n"
        self.csvContent = ""
        for (index, data) in cases.enumerated() {
            var animalName = ""
            var regencies = ""
            let newsTitle = data.title.replacingOccurrences(of: ",", with: ";")
            let newsURL = data.url.replacingOccurrences(of: ",", with: "")
            let newsSite = data.site?.name.replacingOccurrences(of: ",", with: ";") ?? "N/A"
            
            
            for (index, datas) in data.animals.enumerated() {
                animalName = index > 0 ? animalName + "; \(datas.name)" : "\(datas.name)"
            }
            
            
            for (index, datas) in data.regencies.enumerated() {
                regencies = index > 0 ? regencies + "; \(datas.name)" : "\(datas.name)"
            }
            
            csvHead.append("\(index+1),\(newsTitle),\(data.news_date),\(animalName),\(regencies),\(regencies),\(""),\(data.news_date),\(data.label),\(newsSite),\(newsURL)\n")
        }
        self.csvContent = csvHead
    }
}

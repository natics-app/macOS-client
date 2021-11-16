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
    @Published var cases: [NewsModel] = []
    @Published var doneLoading: Bool = false
    
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

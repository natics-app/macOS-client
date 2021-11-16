//
//  CasesCategoriesViewModel.swift
//  Natics
//
//  Created by Peter Lee on 16/11/21.
//

import Foundation
import SwiftUI
import Combine

class CasesCategoriesViewModel: ObservableObject {
    @Published var casesCategories: [CasesCategoriesModel] = []
    
    private let casesCategoriesRequest = CasesCategoriesRequest()
    private var cancellable = Set<AnyCancellable>()
    
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
                guard let data = result.data else {return}
                self.casesCategories = data.labels
                print("Debug cases: \(self.casesCategories)")
            }
            .store(in: &cancellable)
    }
}

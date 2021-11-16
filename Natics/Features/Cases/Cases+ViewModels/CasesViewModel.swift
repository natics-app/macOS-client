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
    
    private let casesRequest = CasesRequest()
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        getAllCases()
    }
    
    func getAllCases() {
        casesRequest.getAllCases()
            .receive(on: DispatchQueue.main, options: nil)
            .sink { result in
                switch result {
                case .failure(let err):
                    print(err.message!)
                case .finished:
                    print("Finish")
                }
            } receiveValue: { response in
                guard let data = response.data else {return}
                self.cases = data.news
            }
            .store(in: &cancellable)

    }
    
    
}

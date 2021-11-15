//
//  AddWatchlistViewModel.swift
//  Natics
//
//  Created by Puras Handharmahua on 15/11/21.
//

import Foundation
import Combine

class AddWatchlistViewModel: ObservableObject {
    
    // MARK: PUBLISHED PROPERTIES
    @Published var searchText: String = ""
    @Published var animalTrendings: [NumberCasesCategories] = []
    
    // MARK: PRIVATE PROPERTIES
    private var cancellable = Set<AnyCancellable>()
    private var dummyData = ["Kukang", "Macan", "Buaya"]
    private var trendingRequest = TrendingRequest()
    
    // MARK: COMPUTED PROPERTIES
    var getAnimalTrendings: [NumberCasesCategories] {
        return animalTrendings
    }
    
    //MARK: COMPUTED PROPERTIES
    var titleString: String {
        return searchText == "" ? "Trending" : "Result"
    }
    
    // MARK: INIT
    init() {
        bind()
        getTrendingAnimals()
    }
    
    private func bind() {
        $searchText
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] value in
                self?.getTrendingAnimals()
            }
            .store(in: &cancellable)
    }
    
    func getTrendingAnimals() {
        trendingRequest
            .getNumberOfCases()
            .receive(on: DispatchQueue.main, options: nil)
            .sink { result in
                switch result {
                case .finished:
                    print("Finished get number of cases")
                case .failure(let err):
                    print(err.message ?? "")
                }
            } receiveValue: { [weak self] value in
                guard let data = value.data else {return}
                self?.animalTrendings = data.categories
            }
            .store(in: &cancellable)
    }
}

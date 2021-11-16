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
    @Published var animalTrendings: [Category] = []
    
    // MARK: PRIVATE PROPERTIES
    private var cancellable = Set<AnyCancellable>()
    private var trendingRequest = TrendingRequest()
    
    // MARK: COMPUTED PROPERTIES
    var getAnimalTrendings: [Category] {
        return searchText == "" ? animalTrendings : animalTrendings.filter({$0.name.lowercased().contains(searchText.lowercased())})
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
    
    // MARK: PRIVATE METHODS
    private func bind() {
//        $searchText
//            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
//            .sink { [weak self] value in
//                self?.getTrendingAnimals()
//            }
//            .store(in: &cancellable)
    }
    
    // MARK: PUBLIC METHODS
    func getTrendingAnimals() {
        print("debugTrending Masuk")
        trendingRequest
            .getNumberOfCases()
            .receive(on: DispatchQueue.main, options: nil)
            .sink { result in
                switch result {
                case .finished:
                    print("debugTrending Finished get number of cases")
                case .failure(let err):
                    print("\(err.message ?? "") - debugTrending")
                }
            } receiveValue: { [weak self] value in
                print("debugTrending data \(value)")
                guard let data = value.data else {return}
                print("debugTrending \(data.categories)")
                self?.animalTrendings = data.categories
            }
            .store(in: &cancellable)
    }
}

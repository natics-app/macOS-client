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
    @Published var animalTrendings: [String] = ["Kukang", "Macan", "Buaya"]
    
    // MARK: PRIVATE PROPERTIES
    private var cancellable = Set<AnyCancellable>()
    private var dummyData = ["Kukang", "Macan", "Buaya"]
    var getAnimalTrendings: [String] {
        return searchText == "" ? dummyData : animalTrendings
    }
    
    //MARK: COMPUTED PROPERTIES
    var titleString: String {
        return searchText == "" ? "Trending" : "Result"
    }
    
    // MARK: INIT
    init() {
        $searchText
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] value in
                print(value.lowercased())
                self?.getTrendingAnimals()
            }
            .store(in: &cancellable)
    }
    
    func getTrendingAnimals() {
        print("call")
        animalTrendings = dummyData.filter({ $0.lowercased().contains(searchText.lowercased()) })
    }
}

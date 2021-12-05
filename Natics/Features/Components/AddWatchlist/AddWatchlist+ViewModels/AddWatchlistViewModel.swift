//
//  AddWatchlistViewModel.swift
//  Natics
//
//  Created by Puras Handharmahua on 15/11/21.
//

import Foundation
import Combine
import SwiftUI

class AddWatchlistViewModel: ObservableObject {
    
    // MARK: CONSTANT
    let addedWatchlistKey = "Added Watchlist"
    
    // MARK: PUBLISHED PROPERTIES
    @Published var searchText: String = ""
    @Published var animalTrendings: [Category] = []
    @Published var selectedAnimal: [Int] = []
    
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
        getTrendingAnimals()
    }
    
    // MARK: PRIVATE METHODS
    
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
    
    // Handle if animal is selected
    func addSelectedAnimal(id: Int) {
        if checkIfIdSelected(id: id) {
            selectedAnimal.removeAll { item in
                item == id
            }
            removeFromUserDefault(id: id)
        } else {
            selectedAnimal.append(id)
            saveToUserDefault(id: id)
        }
    }
    
    // Check if animal ID exist
    func checkIfIdSelected(id: Int) -> Bool {
        return selectedAnimal.contains(id)
    }
    
    // Save to user default
    func saveToUserDefault(id: Int) {
        let defaults = UserDefaults.standard
        var savedAnimal = defaults.object(forKey: addedWatchlistKey) as? [Int] ?? []
        savedAnimal.append(id)
        defaults.set(savedAnimal, forKey: addedWatchlistKey)
    }
    
    // Remove from user default
    func removeFromUserDefault(id: Int) {
        let defaults = UserDefaults.standard
        var savedAnimal = defaults.object(forKey: addedWatchlistKey) as? [Int] ?? []
        savedAnimal.removeAll { item in
            item == id
        }
        defaults.set(savedAnimal, forKey: addedWatchlistKey)
    }
}

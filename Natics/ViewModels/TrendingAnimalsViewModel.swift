import Foundation
import SwiftUI
import Combine
import Charts

class TrendingAnimalsViewModel: ObservableObject {
    @Published var animalCases: [CategoriesTrendingModel] = []
    @Published var animalCasesTopTrending: [CategoriesTrendingModel] = [] {
        didSet {
            setAnimalTrending()
        }
    }
    @Published var trendingAnimalList = [BarChartDataEntry]()
    @Published var trendingAnimalNames = [String]()
    
    private var cancellable = Set<AnyCancellable>()
    private let activeMediaRequest = SitesRequest()
    private let request = TrendingRequest()
    
    init() {
        self.setAnimalTrending()
    }
    
    func getAnimalsTrending(selected: DatePickerModel) {
        request.getTrendingAnimals(startDate: selected.getStartDate(), endDate: selected.getEndDate())
            .receive(on: RunLoop.main)
            .sink { result in
                switch result {
                case .failure(let err):
                    print(err.message!)
                case .finished:
                    print("Finish")
                }
            } receiveValue: { result in
                self.animalCases = result.data!.categories
                let arraySlice = result.data!.categories.prefix(8)
                self.animalCasesTopTrending = Array(arraySlice)
            }
            .store(in: &cancellable)
    }
    
    func getAnimalsTrending(startDate: String, endDate: String) {
        request.getTrendingAnimals(startDate: startDate, endDate: endDate)
            .receive(on: RunLoop.main)
            .sink { result in
                switch result {
                case .failure(let err):
                    print(err.message!)
                case .finished:
                    print("Finish")
                }
            } receiveValue: { result in
                self.animalCases = result.data!.categories
                let arraySlice = result.data!.categories.prefix(8)
                self.animalCasesTopTrending = Array(arraySlice)
            }
            .store(in: &cancellable)
    }
}

extension TrendingAnimalsViewModel {
    func setAnimalTrending() {
        self.trendingAnimalNames = animalCasesTopTrending.map {
            animal in animal.name
        }
        
        self.trendingAnimalList = animalCasesTopTrending.enumerated()
            .map {
                (index, element) in
                return BarChartDataEntry(x: Double(index), y: Double(element.news_count))
            }
    }
}

import Foundation
import SwiftUI
import Combine
import Charts

class TrendingAnimalsViewModel: ObservableObject {
    @Published var animalCases: [CategoriesTrendingModel] = []
    @Published var activeMedia: [ActiveMediaModel] = [] {
        didSet {
            setAnimalTrending()
        }
    }

    @Published var trendingAnimalList = [BarChartDataEntry]()
    @Published var trendingAnimalNames = [String]()
    
    private let categoriesTrendingRequest = TrendingProvinceRequest()
    private var cancellable = Set<AnyCancellable>()
    private let activeMediaRequest = SitesRequest()
    
    func getAnimalsTrending(selected: DatePickerModel) {
        categoriesTrendingRequest.getTrendingAnimals(startDate: selected.getStartDate(), endDate: selected.getEndDate())
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
                self.animalCases = data.categories
                print(self.animalCases)
            }
            .store(in: &cancellable)
    }
    
    func getActiveMedia(startDate: String, endDate: String) {
        activeMediaRequest.getActiveMedia(startDate: startDate, endDate: endDate)
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
                self.activeMedia = data.sites
                print("Debug media: \(self.activeMedia)")
            }
            .store(in: &cancellable)
    }
}

extension TrendingAnimalsViewModel {
    func setAnimalTrending() {
        
    }
}

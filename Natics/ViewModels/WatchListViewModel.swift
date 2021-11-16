//
//  WatchListViewModel.swift
//  Natics
//
//  Created by Farrel Anshary on 14/11/21.
//

import Foundation
import Combine
import SwiftUI

class WatchListViewModel: ObservableObject {
    let id: Int
    @Published var totalCases = HighlightCardContent()
    @Published var doneLoadingTotalCases = false
    @Published var rank = HighlightCardContent()
    @Published var doneLoadingRank = false
    
    private let watchListRequest = WatchListRequest()
    private var cancellable = Set<AnyCancellable>()
    
    init(id: Int) {
        self.id = id
    }
    
    func getTotalCases(selected: DatePickerModel) {
        watchListRequest.getNumberOfCases(category_id: self.id, startDate: selected.getStartDate(), endDate: selected.getEndDate())
            .receive(on: DispatchQueue.main, options: nil)
            .sink { result in
                switch result {
                case .finished:
                    print("Finished!")
                case .failure(let err):
                    print("Debug wl: \(err.message!)")
                }
            } receiveValue: { responses in
                guard let data = responses.data else { return }
                let category = data.category
                
                guard let newValue = category?.newCount,
                      let oldValue = category?.oldCount else { return }
                var changes = newValue - oldValue

                var arrow: String?
                var color: Color?
                if changes < 0 {
                    arrow = "arrowtriangle.down.fill"
                    color = .green
                } else if changes > 0 {
                    arrow = "arrowtriangle.up.fill"
                    color = .red
                }

                changes = abs(changes)

                self.totalCases.value = newValue
                self.totalCases.changes = changes
                self.totalCases.arrow = arrow
                self.totalCases.color = color
                self.doneLoadingTotalCases = true
            }
            .store(in: &cancellable)
    }
    
    func getRank(selected: DatePickerModel) {
        watchListRequest.getRank(category_id: self.id, startDate: selected.getStartDate(), endDate: selected.getEndDate())
            .receive(on: DispatchQueue.main, options: nil)
            .sink { result in
                switch result {
                case .finished:
                    print("Finished!")
                case .failure(let err):
                    print(err.message!)
                }
            } receiveValue: { responses in
                guard let data = responses.data else { return }
                let newValue = data.new_rank
                let oldValue = data.old_rank
                
                var changes = newValue - oldValue
                var arrow: String?
                var color: Color?
                if changes > 0 {
                    arrow = "arrowtriangle.down.fill"
                    color = .green
                } else if changes < 0 {
                    arrow = "arrowtriangle.up.fill"
                    color = .red
                }
                
                changes = abs(changes)
                
                self.rank.value = newValue
                self.rank.changes = changes
                self.rank.arrow = arrow
                self.rank.color = color
                self.doneLoadingRank = true
            }
            .store(in: &cancellable)
    }
}


//MARK: Networking Function for Custom Time Range
extension WatchListViewModel {
    func getTotalCases(startDate: String, endDate: String) {
        watchListRequest.getNumberOfCases(category_id: self.id, startDate: startDate, endDate: endDate)
            .receive(on: DispatchQueue.main, options: nil)
            .sink { result in
                switch result {
                case .finished:
                    print("Finished!")
                case .failure(let err):
                    print("Debug wl: \(err.message!)")
                }
            } receiveValue: { responses in
                guard let data = responses.data else { return }
                let category = data.category
                
                guard let newValue = category?.newCount,
                      let oldValue = category?.oldCount else { return }
                var changes = newValue - oldValue

                var arrow: String?
                var color: Color?
                if changes < 0 {
                    arrow = "arrowtriangle.down.fill"
                    color = .green
                } else if changes > 0 {
                    arrow = "arrowtriangle.up.fill"
                    color = .red
                }

                changes = abs(changes)

                self.totalCases.value = newValue
                self.totalCases.changes = changes
                self.totalCases.arrow = arrow
                self.totalCases.color = color
                self.doneLoadingTotalCases = true
            }
            .store(in: &cancellable)
    }
    
    func getRank(startDate: String, endDate: String) {
        watchListRequest.getRank(category_id: self.id, startDate: startDate, endDate: endDate)
            .receive(on: DispatchQueue.main, options: nil)
            .sink { result in
                switch result {
                case .finished:
                    print("Finished!")
                case .failure(let err):
                    print(err.message!)
                }
            } receiveValue: { responses in
                guard let data = responses.data else { return }
                let newValue = data.new_rank
                let oldValue = data.old_rank
                
                var changes = newValue - oldValue
                var arrow: String?
                var color: Color?
                if changes > 0 {
                    arrow = "arrowtriangle.down.fill"
                    color = .green
                } else if changes < 0 {
                    arrow = "arrowtriangle.up.fill"
                    color = .red
                }
                
                changes = abs(changes)
                
                self.rank.value = newValue
                self.rank.changes = changes
                self.rank.arrow = arrow
                self.rank.color = color
                self.doneLoadingRank = true
            }
            .store(in: &cancellable)
    }
}

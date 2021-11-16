//
//  DatePickerViewModel.swift
//  Natics
//
//  Created by Jackie Leonardy on 03/11/21.
//

import Foundation
import SwiftUI

class DatePickerViewModel: ObservableObject {
    @Published var datePickerList = DatePickerModel.allCases
    @Published var selection: DatePickerModel? = .pastWeek
    @Published var filterStartDate = Date()
    @Published var filterEndDate = Date()
    
    @Published var customStartDate: String?
    @Published var customEndDate: String?
    
    @Published var isCustomTapped = false
    @Published var isEverClicked = false
    @Published var isCustomChosen = false
    
    func setCustomDate(startDate: Date, endDate: Date) {
        customStartDate = dateFormatter(date: startDate)
        customEndDate = dateFormatter(date: endDate)
    }
    
    func customTapped() {
        isEverClicked = true
        isCustomTapped = true
    }
    
    func customChosen() {
        isCustomChosen = true
        isEverClicked = true
        isCustomTapped = true
    }
    
    func closePicker() {
        isCustomTapped = false
    }
    
    func isClicked() {
        isEverClicked = true
        isCustomChosen = false
    }
    
    func checkDateRange() {
        if filterStartDate > filterEndDate {
            filterStartDate = filterEndDate
        }
    }
    
    func returnCustomRange() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let start = dateFormatter.string(from: self.filterStartDate)
        let end = dateFormatter.string(from: self.filterEndDate)
        
        return "\(start) - \(end)"
    }
}

extension DatePickerViewModel {
    private func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}

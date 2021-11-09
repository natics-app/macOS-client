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
    @Published var isCustomTapped = false
    
    @Published var isEverClicked = false
    
    func customTapped() {
        isCustomTapped.toggle()
    }
    
    func closePicker() {
        isCustomTapped = false
    }
    
    func isClicked() {
        isEverClicked = true
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

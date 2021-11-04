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
    
    func customTapped() {
        isCustomTapped.toggle()
    }
    
    func closePicker() {
        isCustomTapped = false
    }
}

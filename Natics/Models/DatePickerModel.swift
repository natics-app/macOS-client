//
//  DatePickerModel.swift
//  Natics
//
//  Created by Jackie Leonardy on 03/11/21.
//

import Foundation
import SwiftUI

enum DatePickerModel: String, CaseIterable {
    case pastWeek = "Past week"
    case pastMonth = "Past month"
    case pastThree = "Past 3 months"
    case pastSix = "Past 6 months"
    case pastYear = "Past year"
}

//MARK: Extension for picker view data
extension DatePickerModel {
    func getImage() -> Image {
        switch self {
        case .pastWeek, .pastMonth, .pastThree, .pastSix, .pastYear:
            return Image(systemName: "doc")
        }
    }
    
    func getCalculatedYear() -> String{
        let TodayDate = dateFormatter(date: Date())
        switch self {
            case .pastWeek:
                return "\(getPastDate(past: 7, formatType: "pickerView")) - \(TodayDate)"
            case .pastMonth:
                return "\(getPastDate(past: 30, formatType: "pickerView")) - \(TodayDate)"
            case .pastThree:
                return "\(getPastDate(past: 90, formatType: "pickerView")) - \(TodayDate)"
            case .pastSix:
                return "\(getPastDate(past: 180, formatType: "pickerView")) - \(TodayDate)"
            case .pastYear:
                return "\(getPastDate(past: 365, formatType: "pickerView")) - \(TodayDate)"
        }
    }
    
    //MARK: Private Function
    private func getPastDate(past dateTo: Int, formatType: String) -> String {
        let date = Calendar.current.date(byAdding: .day, value: -(dateTo), to: Date())!
        if formatType == "pickerView" {
            return "\(dateFormatter(date: date))"
        } else if formatType == "requestDate" {
            return "\(dateFormatterPicker(date: date))"
        }
        return dateFormatter(date: Date())
    }
    
    private func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.string(from: date)
    }
}

extension DatePickerModel {
    //MARK: Getting calculated date for request
    private func dateFormatterPicker(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    func getEndDate() -> String {
         dateFormatterPicker(date: Date())
    }
    
    func getStartDate() -> String {
        switch self {
            case .pastWeek:
                return "\(getPastDate(past: 7, formatType: "requestDate"))"
            case .pastMonth:
                return "\(getPastDate(past: 30, formatType: "requestDate"))"
            case .pastThree:
                return "\(getPastDate(past: 90, formatType: "requestDate"))"
            case .pastSix:
                return "\(getPastDate(past: 180, formatType: "requestDate"))"
            case .pastYear:
                return "\(getPastDate(past: 365, formatType: "requestDate"))"
        }
    }
}

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

extension DatePickerModel {
    func getImage() -> Image {
        switch self {
        case .pastWeek:
            return Image(systemName: "doc")
        case .pastMonth:
            return Image(systemName: "doc")
        case .pastThree:
            return Image(systemName: "doc")
        case .pastSix:
            return Image(systemName: "doc")
        case .pastYear:
            return Image(systemName: "doc")
        }
    }
    
    func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.string(from: date)
    }
    
    func getCalculatedYear() -> String{
        let TodayDate = dateFormatter(date: Date())
        switch self {
        case .pastWeek:
            return "\(getPastDate(past: 7)) - \(TodayDate)"
        case .pastMonth:
            return "\(getPastDate(past: 30)) - \(TodayDate)"
        case .pastThree:
            return "\(getPastDate(past: 90)) - \(TodayDate)"
        case .pastSix:
            return "\(getPastDate(past: 180)) - \(TodayDate)"
        case .pastYear:
            return "\(getPastDate(past: 365)) - \(TodayDate)"
        }
    }
    
    func getPastDate(past dateTo: Int) -> String {
        let date = Calendar.current.date(byAdding: .day, value: -(dateTo), to: Date())!
        return "\(dateFormatter(date: date))"
    }
}


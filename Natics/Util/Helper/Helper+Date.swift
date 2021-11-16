//
//  Helper+Date.swift
//  Natics
//
//  Created by Puras Handharmahua on 16/11/21.
//

import Foundation

extension Date {
    func getDateString(with format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

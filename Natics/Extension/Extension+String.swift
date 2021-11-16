//
//  Extension+String.swift
//  Natics
//
//  Created by Puras Handharmahua on 16/11/21.
//

import Foundation

extension String {
    
    // MARK: - CAPITALIZING FIRST LETTER
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

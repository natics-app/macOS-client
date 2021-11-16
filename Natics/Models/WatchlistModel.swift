//
//  WatchlistModel.swift
//  Natics
//
//  Created by Jackie Leonardy on 02/11/21.
//

import Foundation
import SwiftUI

// MARK: - GATAU INI BUAT APA
enum WatchlistModel: String, CaseIterable {
    case trends = "Kukang"
    case cases = "Monyet"
    case settings = "Harimau"
}

extension WatchlistModel {
    func getImage() -> Image {
        switch self {
        case .trends:
            return Image(systemName: "flame.fill")
        case .cases:
            return Image(systemName: "paperplane.fill")
        case .settings:
            return Image(systemName: "tray.fill")
        }
    }
}

// MARK: - ANIMAL RANKS
struct AnimalRankGetResponse: Codable {
    var old_rank: Int
    var new_rank: Int
}

// MARK: - ANIMALS NUMBER OF CASES
struct NewsAnimalCategoryResponse: Codable {
    var category: Category? // Get this from Category in models
}

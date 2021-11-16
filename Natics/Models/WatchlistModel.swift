//
//  WatchlistModel.swift
//  Natics
//
//  Created by Jackie Leonardy on 02/11/21.
//

import Foundation
import SwiftUI

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

struct AnimalRankGetResponse: Codable {
    var old_rank: Int
    var new_rank: Int
}

struct NewsAnimalCategoryResponse: Codable {
    var category: Category?
}


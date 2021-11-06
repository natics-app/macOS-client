//
//  DashboardModel.swift
//  Natics
//
//  Created by Jackie Leonardy on 02/11/21.
//

import Foundation
import SwiftUI

enum DashboardModel: String, CaseIterable {
    case trends = "Trends"
    case cases = "Cases"
    case settings = "Settings"
}

extension DashboardModel {
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

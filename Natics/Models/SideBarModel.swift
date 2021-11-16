//
//  SideBarModel.swift
//  Natics
//
//  Created by Jackie Leonardy on 01/11/21.
//

import Foundation
import SwiftUI

enum SideBarModel: String, CaseIterable {
    case trends = "Trends"
    case cases = "Cases"
    case settings = "Settings"
    
    func getImage() -> Image {
        switch self {
        case .trends:
            return Image(systemName: "doc")
        case .cases:
            return Image(systemName: "doc")
        case .settings:
            return Image(systemName: "doc")
        }
    }
    
    @ViewBuilder func getContainingView() -> some View {
        switch self {
        case .trends:
            TrendsView()
        case .cases:
            CasesView(casesViewModel: CasesViewModel())
        case .settings:
            SettingsView()
        }
    }
}

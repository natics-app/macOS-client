//
//  WatchlistViewModel.swift
//  Natics
//
//  Created by Jackie Leonardy on 02/11/21.
//

import Foundation
import SwiftUI

class WatchlistViewModel: ObservableObject {
    @Published var menuItems = WatchlistModel.allCases
    @Published var selection: WatchlistModel? = .cases
    
    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?
            .tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    
    /// Fungsi untuk mengembalikan View sesuai dengan enum dari model dashboard yang dilooping
    /// - Returns: ViewDashboard yang akan ditampilkan
    @ViewBuilder func getContainingView() -> some View {
        switch selection {
        case .trends:
            TrendsView()
        case .cases:
            CasesView()
        case .settings:
            SettingsView()
        case .none:
            TrendsView()
        }
    }
}

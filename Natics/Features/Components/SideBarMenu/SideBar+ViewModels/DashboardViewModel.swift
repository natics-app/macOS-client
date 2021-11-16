//
//  DashboardViewModel.swift
//  Natics
//
//  Created by Jackie Leonardy on 02/11/21.
//

import Foundation
import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var menuItems = DashboardModel.allCases
    @Published var selection: DashboardModel? = .trends
    
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
            CasesView(casesViewModel: CasesViewModel())
        case .settings:
            WatchListViewDetail(id: 79)
        case .none:
            TrendsView()
        }
    }
}

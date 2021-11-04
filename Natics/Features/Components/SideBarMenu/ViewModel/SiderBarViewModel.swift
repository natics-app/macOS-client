//
//  SiderBarViewModel.swift
//  Natics
//
//  Created by Jackie Leonardy on 01/11/21.
//

import Foundation
import SwiftUI

class SideBarViewModel: ObservableObject {
    @Published var menuItems = SideBarModel.allCases
    @Published var selection: SideBarModel? = .trends
    @Published var customTimeRangePopOver: Bool = false
    
    func showPopover() {
        customTimeRangePopOver.toggle()
    }
    
    func closePopOver() {
        customTimeRangePopOver = false
    }
    
    func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?
            .tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

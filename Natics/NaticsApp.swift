//
//  NaticsApp.swift
//  Natics
//
//  Created by Puras Handharmahua on 26/10/21.
//

import SwiftUI
import AppKit
import Combine

@main
struct NaticsApp: App {
    @StateObject var viewModel = DatePickerViewModel()
    
    var body: some Scene {
        WindowGroup {
            SideBarView()
                .frame(minWidth: 1236, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 600, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .environmentObject(viewModel)
        }.commands {
            SidebarCommands()
            ToolbarCommands()
        }
    }
}

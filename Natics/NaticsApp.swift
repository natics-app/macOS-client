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
    @StateObject var testVM = CasesViewModel()
    
    private var isHidden = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                SideBarView()
                    .frame(minWidth: 1236, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 600, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .environmentObject(viewModel)
                
                if !isHidden {
                    Text("Tes")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.5))
                }
            }
        }.commands {
            SidebarCommands()
            ToolbarCommands()
        }
    }
}

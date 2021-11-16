//
//  SideBarView.swift
//  Natics
//
//  Created by Jackie Leonardy on 01/11/21.
//

import SwiftUI

struct SideBarView: View {
    @StateObject var viewModel = SideBarViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List{
                    DashboardView()
                    WatchListView()
                    Spacer()
                }
                .listStyle(SidebarListStyle())
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button(action: viewModel.toggleSidebar) {
                            Image(systemName: "sidebar.left")
                                .help("Toggle Sidebar")
                        }
                    }
                }
            }.navigationTitle("")
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}

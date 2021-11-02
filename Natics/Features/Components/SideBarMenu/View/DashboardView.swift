//
//  DashboardView.swift
//  Natics
//
//  Created by Jackie Leonardy on 01/11/21.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var viewModel = SideBarViewModel()
    var body: some View {
        Section(header:
                    Text("Dashboard")
                    .font(.system(size: 13))
            ) {
            ForEach(viewModel.menuItems, id: \.hashValue) { menu in
                NavigationLink(destination: menu.getContainingView(), tag: menu, selection: $viewModel.selection) {
                    menu.getImage()
                    Text(menu.rawValue)
                }
            }
        }.collapsible(false)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

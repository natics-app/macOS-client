//
//  WatchListView.swift
//  Natics
//
//  Created by Jackie Leonardy on 01/11/21.
//

import SwiftUI

struct WatchListView: View {
    @StateObject var viewModel = WatchlistViewModel()
    var body: some View {
        Section(header:
                    Text("Watchlist")
                    .font(.system(size: 13))
            ) {
            ForEach(viewModel.menuItems, id: \.hashValue) { menu in
                NavigationLink(destination: viewModel.getContainingView(), tag: menu, selection: $viewModel.selection) {
                    menu.getImage()
                    Text(menu.rawValue)
                }
            }
        }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}

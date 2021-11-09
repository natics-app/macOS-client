//
//  Navbar.swift
//  Natics
//
//  Created by Jackie Leonardy on 02/11/21.
//

import SwiftUI

struct ToolbarView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                ActionButton(action: {
                }, imageName: "bell.badge.fill")
                    .padding(.trailing, 16)
                    .help("Notification Bell")
                
                FilledButton(title: "Add Watchlist") {
                }.help("Add Watch List")
            }.padding(.init(top: 27, leading: 0, bottom: 0, trailing: 16))
        }
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
    }
}

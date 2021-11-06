//
//  SettingsView.swift
//  Natics
//
//  Created by Jackie Leonardy on 01/11/21.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Dashboard Settings")
        }
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigation) {
                Text("Settings")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

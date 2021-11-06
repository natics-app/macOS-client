//
//  FilledButton.swift
//  Natics
//
//  Created by Jackie Leonardy on 02/11/21.
//

import SwiftUI

struct FilledButton: View {
    let title: String
    let action: () -> ()
    
    var body: some View {
        Button(title, action: action)
            .foregroundColor(.white)
            .padding([.top, .bottom], 8)
            .padding([.trailing, .leading], 24)
            .background(Color.colorTheme.MCDarkGreen)
            .cornerRadius(8)
            .buttonStyle(BorderlessButtonStyle())
    }
}

struct FilledButton_Previews: PreviewProvider {
    static var previews: some View {
        FilledButton(title: "Add Watchlist") {
            print("data")
        }
    }
}

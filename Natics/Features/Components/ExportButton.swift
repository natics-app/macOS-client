//
//  ExportButton.swift
//  MacOSMap
//
//  Created by Jackie Leonardy on 28/10/21.
//

import SwiftUI

struct ExportButton: View {
    var clickedAction: () -> ()
    
    var body: some View {
        Button(action: clickedAction) {
            ZStack {
                Color.accentColor
                    .cornerRadius(8)
                Text("Export")
                    .padding(.all, 8)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .foregroundColor(.white)
            }
        }
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct ExportButton_Previews: PreviewProvider {
    static var previews: some View {
        ExportButton {
            print("abcde")
        }
    }
}


//
//  TextButton.swift
//  Natics
//
//  Created by Jackie Leonardy on 02/12/21.
//

import SwiftUI

struct TextButton: View {
    let label: String
    let action: () -> ()
    
    @Binding var selected: NotificationSelection
    
    var body: some View {
        Button(action: self.action, label: {
            VStack {
                Text(self.label)
                    .foregroundColor(.primary)
                    .padding(.vertical)
                    .padding(.horizontal, 4)
                    .border(width: 2, edges: [.bottom], color: selected.rawValue == label ? Color.accentColor : Color.clear)
            }
        })
        .buttonStyle(LinkButtonStyle())
        .opacity(0.85)
        .animation(.easeInOut(duration: 0.3))
    }
}


//
//  NotificationLabelButton.swift
//  Natics
//
//  Created by Jackie Leonardy on 02/12/21.
//

import SwiftUI

struct NotificationLabelButton: View {
    let label: String
    let action: () -> ()
    let totalNotification: Int
    
    @Binding var selected: NotificationSelection
    
    var body: some View {
        Button(action: self.action, label: {
            HStack(spacing: 4) {
                Text(self.label)
                    .foregroundColor(.primary)
                    .padding(.vertical)
                    .padding(.horizontal, 4)
                    
                Text("\(self.totalNotification)")
                    .foregroundColor(.white)
                    .padding(.horizontal, 4)
                    .background(Color.red)
                    .cornerRadius(4)
                
            }.border(width: 2, edges: [.bottom], color: selected.rawValue == label ? Color.accentColor : Color.clear)
        })
        .buttonStyle(LinkButtonStyle())
        .opacity(0.85)
        .animation(.easeInOut(duration: 0.3))
    }
}

struct NotificationLabelButton_Previews: PreviewProvider {
    static var previews: some View {
        NotificationLabelButton(label: "aaa", action: {
            
        }, totalNotification: 21, selected: .constant(NotificationSelection.watchlist))
    }
}

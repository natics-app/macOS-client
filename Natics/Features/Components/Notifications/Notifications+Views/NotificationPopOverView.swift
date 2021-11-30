//
//  NotificationPopOverView.swift
//  Natics
//
//  Created by Jackie Leonardy on 30/11/21.
//

import SwiftUI

struct NotificationPopOverView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "hands.clap.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                Spacer()
                Text("Notification")
                    .font(Font.system(size: 18))
            }.padding(24)
            
            HStack {
                Button {
                } label: {
                    VStack {
                        Text("Unread")
                            .foregroundColor(.primary)
                            .padding()
                            .border(width: 1, edges: [.bottom], color: Color.accentColor)
                    }
                }
                .buttonStyle(LinkButtonStyle())
                
                Button {
                    
                } label: {
                    HStack {
                        Text("All")
                            .foregroundColor(.primary)
                            .padding()
                            
                        Text("36")
                    }.border(width: 1, edges: [.bottom], color: Color.accentColor)
                }
                .buttonStyle(LinkButtonStyle())
            }
            Divider()
            Spacer()
        }
        .frame(width: 320, height: 900)
    }
}

struct NotificationPopOverView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPopOverView()
    }
}

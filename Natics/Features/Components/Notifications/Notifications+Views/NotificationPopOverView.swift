//
//  NotificationPopOverView.swift
//  Natics
//
//  Created by Jackie Leonardy on 30/11/21.
//

import SwiftUI

struct NotificationPopOverView: View {
    @EnvironmentObject var notificationViewModel: NotificationViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "hands.clap.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                Spacer()
                Text("Notification")
                    .font(Font.system(size: 18))
            }.padding(24)
            
            HStack(spacing: 8) {
                TextButton(label: NotificationSelection.unread.rawValue, action: {
                    notificationViewModel.changeSelection(selected: .unread)
                }, selected: $notificationViewModel.notificationSelected)
                
                NotificationLabelButton(label: NotificationSelection.allNotification.rawValue, action: {
                    notificationViewModel.changeSelection(selected: .allNotification)
                }, totalNotification: notificationViewModel.getNotificationCount(), selected: $notificationViewModel.notificationSelected)
                
                TextButton(label: NotificationSelection.watchlist.rawValue, action: {
                    notificationViewModel.changeSelection(selected: .watchlist)
                }, selected: $notificationViewModel.notificationSelected)
                
                
                Spacer()
            }.padding(.horizontal)
            Divider()
            
            GeometryReader { geo in
                ScrollView(.vertical) {
                    VStack {
                        List {
                            ForEach(
                                notificationViewModel.getNotification(),
                                id: \.self
                            ) { item in
                                Button {
                                    
                                } label: {
                                    NotificationRow(animalTitle: "Kukang", notificationLabel: "is now Trending", notificationDate: "Now")
                                }
                                .cornerRadius(8)
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .frame(height: geo.frame(in: .local).size.height)
                }
            }
            .frame(maxHeight: .infinity)
            
            Spacer()
        }
        .frame(width: 320, height: 900)
    }
}

struct NotificationPopOverView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPopOverView()
            .environmentObject(NotificationViewModel())
    }
}

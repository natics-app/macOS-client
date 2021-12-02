//
//  NotificationViewModel.swift
//  Natics
//
//  Created by Jackie Leonardy on 30/11/21.
//

import SwiftUI

class NotificationViewModel: ObservableObject {
    @Published var selection = "Unread"
    @Published var notificationSelected: NotificationSelection = .allNotification
    @Published var notificationPopoverShown: Bool = false
    @Published private var notification =  Array(0...24)
    
    func getNotificationCount() -> Int {
        return 24
    }
    
    func getNotification() -> [Int] {
        return notification
    }
    
    func showPopover() {
        notificationPopoverShown.toggle()
    }
    
    func changeSelection(selected: NotificationSelection) {
        notificationSelected = selected
        
        switch notificationSelected {
            case .unread:
                getUnread()
            case .allNotification:
                getAllNotification()
            case .watchlist:
                getWatchList()
        }
    }
}

// MARK: Private function to retrieve Notification
extension NotificationViewModel {
    private func getUnread() {
        print("Unread Notif Section")
        notification =  Array(0...5)
    }
    
    private func getAllNotification() {
        print("All Notif Section")
        notification =  Array(0...24)
    }
    
    private  func getWatchList() {
        print("WatchList Notif Section")
        notification =  Array(0...1)
    }
}

enum NotificationSelection: String {
    case unread = "Unread"
    case allNotification = "All"
    case watchlist = "Watchlist"
}

//
//  NaticsApp.swift
//  Natics
//
//  Created by Puras Handharmahua on 26/10/21.
//

import SwiftUI
import AppKit
import Combine
import PushNotifications
//import PusherSwift

@main
struct NaticsApp: App {
    @StateObject var viewModel = DatePickerViewModel()
    @StateObject var testVM = CasesViewModel()
    @StateObject var notificationVM: NotificationViewModel = NotificationViewModel()
    
    private var isHidden = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                SideBarView()
                    .frame(minWidth: 1236, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 600, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .environmentObject(viewModel)
                    .environmentObject(notificationVM)
                
                if !isHidden {
                    Text("Tes")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.5))
                }
            }
        }.commands {
            SidebarCommands()
            ToolbarCommands()
        }
    }
}

//@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate{
    
    let pushNotification = PushNotifications.shared
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        self.pushNotification.start(instanceId: "44ad15c6-2c62-4c42-9ccb-6056fcb55849")
        self.pushNotification.registerForRemoteNotifications()
        try? self.pushNotification.addDeviceInterest(interest: "debug-test")
    }
    
    func application(_ application: NSApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        self.pushNotification.registerDeviceToken(deviceToken)
    }
    
    func application(_ application: NSApplication, didReceiveRemoteNotification userInfo: [String : Any]) {
        self.pushNotification.handleNotification(userInfo: userInfo)
        print(userInfo)
    }
    
    func application(_ application: NSApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Remote notification support is unavailable due to error: \(error.localizedDescription)")
    }
}

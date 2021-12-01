//
//  Navbar.swift
//  Natics
//
//  Created by Jackie Leonardy on 02/11/21.
//

import SwiftUI

struct ToolbarView: View {
    
    @State private var isShown = false
    @EnvironmentObject var notificationVM: NotificationViewModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    
                    ActionButton(action: {
                        notificationVM.showPopover()
                    }, imageName: "bell.badge.fill")
                        .padding(.trailing, 16)
                        .help("Notification Bell")
                        .popover(isPresented: $notificationVM.notificationPopoverShown) {
                            NotificationPopOverView()
                        }
                    
                    FilledButton(title: "Add Watchlist") {
                        isShown.toggle()
                    }.help("Add Watch List")
                    
                }
                .padding(.init(top: 27, leading: 0, bottom: 0, trailing: 16))
            }
            .sheet(isPresented: $isShown, onDismiss: nil, content: {
                VStack {
                    AddWatchlistView()
                        .frame(width: 550, height: 600, alignment: .center)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.black.opacity(0.75))
            })
        }
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
            .environmentObject(NotificationViewModel())
    }
}

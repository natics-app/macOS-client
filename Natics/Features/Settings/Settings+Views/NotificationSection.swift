//
//  NotificationSection.swift
//  SettingsPage
//
//  Created by Peter Lee on 09/11/21.
//

import SwiftUI

struct NotificationSection: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Notification")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(width: 1260, alignment: .leading)
                    .padding(.top, 24)
                    .padding(.leading, 24)
                
                Divider()
                    .padding([.leading, .trailing], 16)
                
                HStack {
                    Image(systemName: "bell")
                        .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                        .offset(x: 10)
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20, alignment: .leading)
                        .offset(x:-20)
                        .padding(.leading, 46)
                        .padding(.trailing, 24)
                    
                    VStack{
                        Text("Desktop push notification")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .frame(width: 500, alignment: .leading)
                            .padding(.bottom, 2)
                            
                        
                        Text("Receive push notifications on the latest information")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                            .frame(width: 500, alignment: .leading)
                    }
                    

                    

                    Spacer()

                    Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {}
                        .toggleStyle(SwitchToggleStyle(tint: .green))
                        .padding(.trailing, 54)
                        .padding([.top, .bottom], 38)
                }
                Divider()
                    .padding([.leading, .trailing], 24)
            }
            
        }
    }
}

struct NotificationSection_Previews: PreviewProvider {
    static var previews: some View {
        NotificationSection()
    }
}

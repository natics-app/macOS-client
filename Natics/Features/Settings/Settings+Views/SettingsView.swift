//
//  SettingsView.swift
//  Natics
//
//  Created by Jackie Leonardy on 01/11/21.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack{
            VStack{
                Text("Settings")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(width: 1260, alignment: .leading)
                    .padding(.top, 24)
                    .padding(.leading, 24)
                AccountSection()
                NotificationSection()
                LanguageSection()
                AppearanceSection()
            }
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

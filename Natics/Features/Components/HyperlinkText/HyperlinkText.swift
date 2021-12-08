//
//  HyperlinkText.swift
//  Natics
//
//  Created by Jackie Leonardy on 09/11/21.
//

import SwiftUI

struct HyperlinkText: View {
    @Environment(\.openURL) var openURL
    var urlLink: String
    
    var body: some View {
        Button(action: {
            openURL(URL(string: urlLink)!)
        }) {
            Text(urlLink)
                .font(Font.custom("SF Pro Text", size: 13))
                .underline()
                .foregroundColor(Color.blue)
                
        }.buttonStyle(PlainButtonStyle())
        .onHover { inside in
            if inside {
                NSCursor.pointingHand.push()
            } else {
                NSCursor.pop()
            }
        }
    }
}

struct HyperlinkText_Previews: PreviewProvider {
    static var previews: some View {
        HyperlinkText(urlLink: "https://www.kompas.com/sains/read/2021/11/08/180200723/5-burung-terbesar-di-dunia?page=all")
    }
}

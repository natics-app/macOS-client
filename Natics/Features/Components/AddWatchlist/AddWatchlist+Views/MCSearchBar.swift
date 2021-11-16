//
//  MCSearchBar.swift
//  Natics
//
//  Created by Puras Handharmahua on 15/11/21.
//

import SwiftUI

struct MCSearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search animal name", text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
                    .background(Color.colorTheme.MCDarkGrey)
            }
            .padding(10)
            .background(
                Color.colorTheme.MCDarkGrey.cornerRadius(8)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
            )
        }
        
    }
}

struct MCSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        MCSearchBar(text: .constant("sss"))
    }
}

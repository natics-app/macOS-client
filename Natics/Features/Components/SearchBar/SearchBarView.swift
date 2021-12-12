//
//  SearchBarView.swift
//  Natics
//
//  Created by Jackie Leonardy on 01/11/21.
//


import SwiftUI

struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
            TextField("Search...", text: $text) { changed in
                if changed {
                    isEditing = true
                } else {
                    isEditing = false
                }
            } onCommit: {
                
            }.padding(7)
                .padding(.horizontal, 25)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                            }.buttonStyle(PlainButtonStyle())
                                .padding(.trailing, 8)
                        }
                    }
                )
                .background(Color.colorTheme.MCDarkGrey)
                .animation(.easeInOut(duration: 0.4))
        }
    }
}

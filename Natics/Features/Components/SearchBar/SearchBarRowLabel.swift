//
//  SearchBarRowLabel.swift
//  Natics
//
//  Created by Jackie Leonardy on 11/11/21.
//

import SwiftUI

struct SearchBarRowLabel: View {
    @State private var onHover = false
    @Binding var temporaryField : [String]
    @Binding var distinctField : [String]
    
    var name : String
    
    var body: some View {
        Button {
            withAnimation {
                temporaryField = distinctField
                
                temporaryField.append(name)
                
                distinctField.appendDistinct(contentsOf: temporaryField) { distinct1, distinct2 in
                    return distinct1 != distinct2
                }
            }
        } label: {
            Text(name)
        }.padding(4)
        .foregroundColor(onHover ? Color.colorTheme.MCDarkGrey : Color.colorTheme.MCLightGrey)
        .background(onHover ? Color.colorTheme.MCLightGreen : Color.colorTheme.MCDarkGreen)
        .buttonStyle(.plain)
        .cornerRadius(8)
        .frame(maxWidth: 120)
        .fixedSize(horizontal: true, vertical: false)
        .onHover { hover in
            self.onHover = hover
        }
        
    }
}

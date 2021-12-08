//
//  LabelButton.swift
//  Natics
//
//  Created by Jackie Leonardy on 10/11/21.
//

import SwiftUI

struct LabelButton: View {
    var title: String
    var action: () -> ()
    var color: Color
    
    var body: some View {
        
        Button(action: action) {
            Text(title)
            Image(systemName: "xmark")
        }.padding(4)
        .buttonStyle(.plain)
        .background(color)
        .cornerRadius(8)
        .frame(maxWidth: 120)
        .fixedSize(horizontal: true, vertical: false)
    }
}

struct LabelButton_Previews: PreviewProvider {
    static var previews: some View {
        LabelButton(title: "Testing 123 123 123 ", action: {
            
        }, color: Color(red: 0, green: 0, blue: 0.5))
        
        LabelButton(title: "Kalimantan", action: {
            
        }, color: Color(red: 0, green: 0, blue: 0.5))
    }
}

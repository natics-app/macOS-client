//
//  RisingHeader.swift
//  Natics
//
//  Created by Christian Adiputra on 06/11/21.
//

import SwiftUI

struct RisingHeader: View {
    var body: some View {
        HStack(spacing: 24) {
            Text("No")
                .fontWeight(.medium)
                .frame(width: 24, alignment: .leading)
            Text("Animal Name")
                .fontWeight(.medium)
                .frame(width: 216, alignment: .leading)
            Text("Total Animal")
                .fontWeight(.medium)
                .frame(width: 81, alignment: .leading)
            Text("Total Cases")
                .fontWeight(.medium)
                .frame(width: 75, alignment: .leading)
            Text("Change")
                .fontWeight(.medium)
                .frame(width: 70, alignment: .leading)
            
        }
        .frame(height: 33,alignment: .leading)
        .foregroundColor(Color.colorTheme.MCMainGreen)
        .padding(.leading,16)
        .padding(.trailing,32)
        .background(Color.colorTheme.MCDarkGrey)
    }
}

struct RisingHeader_Previews: PreviewProvider {
    static var previews: some View {
        RisingHeader()
    }
}

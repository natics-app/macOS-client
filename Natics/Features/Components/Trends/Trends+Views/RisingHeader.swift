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
            Text("Current News")
                .fontWeight(.medium)
                .frame(width: 88, alignment: .leading)
            Text("Recent News")
                .fontWeight(.medium)
                .frame(width: 95, alignment: .leading)
            Text("%Change")
                .fontWeight(.medium)
                .frame(width: 70, alignment: .leading)
            
        }
        .frame(height: 37,alignment: .leading)
        .foregroundColor(Color.white)
        .padding(.horizontal,16)
        .background(Color.colorTheme.MCDarkGrey)
    }
}

struct RisingHeader_Previews: PreviewProvider {
    static var previews: some View {
        RisingHeader()
    }
}

//
//  CasesTableHeader.swift
//  Natics
//
//  Created by Christian Adiputra on 09/11/21.
//

import SwiftUI

struct CasesTableHeader: View {
    var body: some View {
        HStack (spacing: 0) {
            HStack(spacing: 16) {
                Text("No")
                    .fontWeight(.medium)
                    .frame(width: 42, alignment: .leading)
                Text("News Title")
                    .fontWeight(.medium)
                    .frame(width: 204, alignment: .leading)
                Text("News Date")
                    .fontWeight(.medium)
                    .frame(width: 88, alignment: .leading)
                Text("Animal Name")
                    .fontWeight(.medium)
                    .frame(width: 190, alignment: .leading)
                Text("Location 1")
                    .fontWeight(.medium)
                    .frame(width: 97, alignment: .leading)
                Text("Location 2")
                    .fontWeight(.medium)
                    .frame(width: 97, alignment: .leading)
            }
            HStack(spacing: 16) {
                Text("Organization")
                    .fontWeight(.medium)
                    .frame(width: 97, alignment: .leading)
                Text("Cases Date")
                    .fontWeight(.medium)
                    .frame(width: 85, alignment: .leading)
                Text("Cases Categories")
                    .fontWeight(.medium)
                    .frame(width: 116, alignment: .leading)
                    .lineLimit(0)
                Text("Media Name")
                    .fontWeight(.medium)
                    .frame(width: 85, alignment: .leading)
                Text("Link")
                    .fontWeight(.medium)
                    .frame(width: 160, alignment: .leading)
            }
        }
        .frame(width: 1533, height: 49 ,alignment: .leading)
        .foregroundColor(Color.colorTheme.MCMainGreen)
        .padding(.leading,16)
        .padding(.trailing,64)
        .background(Color.colorTheme.MCDarkGrey)
    }
}

struct CasesTableHeader_Previews: PreviewProvider {
    static var previews: some View {
        CasesTableHeader()
    }
}

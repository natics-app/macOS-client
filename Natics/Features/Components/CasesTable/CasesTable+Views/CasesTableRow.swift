//
//  CasesTableRow.swift
//  Natics
//
//  Created by Christian Adiputra on 09/11/21.
//

import SwiftUI

struct CasesTableRow: View {
    var body: some View {
        HStack (spacing: 0) {
            HStack(spacing: 16) {
                Text("1")
                    .fontWeight(.medium)
                    .frame(width: 42, alignment: .leading)
                Text("Penangkapan Beo")
                    .fontWeight(.medium)
                    .frame(width: 204, alignment: .leading)
                Text("2021/10/21")
                    .fontWeight(.medium)
                    .frame(width: 88, alignment: .leading)
                Text("Beo")
                    .fontWeight(.medium)
                    .frame(width: 190, alignment: .leading)
                Text("Bali")
                    .fontWeight(.medium)
                    .frame(width: 97, alignment: .leading)
                Text("Denpasar")
                    .fontWeight(.medium)
                    .frame(width: 97, alignment: .leading)
            }
            .foregroundColor(Color.colorTheme.MCBlack)
            HStack(spacing: 16) {
                Text("IAR")
                    .fontWeight(.medium)
                    .frame(width: 97, alignment: .leading)
                Text("1/01/2021")
                    .fontWeight(.medium)
                    .frame(width: 85, alignment: .leading)
                Text("Penangkapan")
                    .fontWeight(.medium)
                    .frame(width: 116, alignment: .leading)
                    .lineLimit(0)
                Text("Medium.com")
                    .fontWeight(.medium)
                    .frame(width: 85, alignment: .leading)
                Text("www.medium.com")
                    .fontWeight(.medium)
                    .frame(width: 115, alignment: .leading)
                    .lineLimit(0)
            }
            .foregroundColor(Color.colorTheme.MCBlack)
            HStack{
                Button(action: {}){
                    Text("Edit")
                        .fontWeight(.medium)
                }
                    .frame(width: 74, height: 20)
                    .buttonStyle(.plain)
                    .background(Color.colorTheme.MCDarkGreen)
                    .cornerRadius(4)
                    .padding(.leading, 32)
                Button(action: {}){
                    Text("Remove")
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                }
                    .frame(width: 74, height: 20)
                    .buttonStyle(.plain)
                    .background(Color.gray)
                    .cornerRadius(4)
                    .padding(.leading, 16)
            }
            
        }
        .padding(.leading, 16)
    }
}

struct CasesTableRow_Previews: PreviewProvider {
    static var previews: some View {
        CasesTableRow()
    }
}

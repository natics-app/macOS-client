//
//  RisingCasesTable.swift
//  Natics
//
//  Created by Christian Adiputra on 03/11/21.
//

import SwiftUI
import AppKit


struct RisingCasesTable: View {
    
    
    var body: some View {
        VStack() {
            HStack {
                HStack(alignment: .center){
                    Text("Rising Cases")
                        .foregroundColor(Color.colorTheme.MCBlack)
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                    Button(action: {
                        print("Clicked")
                    }, label: {
                        Image(systemName: "info.circle")
                            .resizable()
                            .foregroundColor(Color.gray)
                    })
                        .frame(width: 18, height: 18)
                        .buttonStyle(.plain)
                        .foregroundColor(Color.colorTheme.MCDarkGrey)
                }
                .padding(.leading, 24)
                
                Spacer()
                Button(action: {}){
                    Text("Export")                        
                }
                    .frame(width: 73, height: 28)
                    .buttonStyle(.plain)
                    .background(Color.colorTheme.MCDarkGreen)
                    .cornerRadius(4)
                    .padding(.trailing, 24)
            }
            .padding(.vertical)
            .padding(.top)
            VStack(alignment: .leading, spacing: 0){
                RisingHeader()
                List {
                    ForEach(1..<8) { _ in
                        RisingRow()
                            .frame(height: 33)
                    }
                }
            }
        }
        .background(Color.colorTheme.MCLightGrey)
        .frame(width: 610, height: 420)
        .border(Color.colorTheme.MCOutline, width: 1)
        .cornerRadius(4)
        .padding()
    }
}

struct RisingCasesTable_Previews: PreviewProvider {
    static var previews: some View {
        RisingCasesTable()
    }
}

//
//  RisingCasesTable.swift
//  Natics
//
//  Created by Christian Adiputra on 06/11/21.
//

import SwiftUI
import AppKit


struct RisingCasesTable: View {
    @ObservedObject var viewModel: TrendingRisingCaseViewModel
    
    var body: some View {
        VStack() {
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    HStack(alignment: .center){
                        Text("Overall Rising Cases")
                            .foregroundColor(Color.white)
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
                    Text("The table displayed represent the Changes Rate among Animal Cases reported.")
                        .foregroundColor(Color.gray)
                }
                
                Spacer()
                Button(action: {}){
                    Text("Export")
                }
                    .frame(width: 73, height: 28)
                    .buttonStyle(.plain)
                    .background(Color.colorTheme.MCDarkGreen)
                    .cornerRadius(4)
            }
            .padding(.horizontal,24)
            .padding(.top, 24)
            InsightCard()
                .frame(width: 562, height: 83)
                .background(Color.colorTheme.MCBlack)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.colorTheme.MCDarkGrey, lineWidth: 2)
                )
                .padding()
            VStack(alignment: .leading, spacing: -15){
                RisingHeader()
                List {
//                    ForEach(viewModel.risingCasesTopTrending, id: \.id) { risingCase in
//                        RisingRow(risingCaseModel: risingCase, rowID: 1)
//                            .frame(height: 33)
//                    }
                    
                    ForEach(Array(viewModel.risingCasesTopTrending.enumerated()), id: \.offset) { index, element in
                        RisingRow(risingCaseModel: element, rowID: index+1)
                            .frame(height: 33)
                        
                    }
                }
            }
        }
        .background(Color.colorTheme.MCDarkDropdown)
        .frame(width: 610, height: 552)
        .cornerRadius(4)
        .padding()
    }
}

struct RisingCasesTable_Previews: PreviewProvider {
    static var previews: some View {
        RisingCasesTable(viewModel: TrendingRisingCaseViewModel())
            
    }
}

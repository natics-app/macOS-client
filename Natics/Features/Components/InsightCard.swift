//
//  InsightCard.swift
//  Natics
//
//  Created by Christian Adiputra on 30/11/21.
//

import SwiftUI

struct InsightCard: View {
    
    @State var info: String = "In the last 3 months, there have been 37 new cases where Illegal Wildlife Trading is the most cases, in the total of 24 cases"
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "lightbulb")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.colorTheme.MCLightGrey)
                .frame(width: 30, height: 30)
            VStack(alignment: .leading, spacing: 4) {
                Text("Insight")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.colorTheme.MCLightGrey)
                Text(info)
                    .foregroundColor(Color.gray)
            }
        }
        .padding(.leading, 22)
        .padding(.trailing, 24)
        
    }
}

struct InsightCard_Previews: PreviewProvider {
    static var previews: some View {
        InsightCard()
            .frame(width: 562, height: 83)
            .background(Color.colorTheme.MCBlack)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.colorTheme.MCDarkGrey, lineWidth: 2)
            )
            .padding()
            
    }
}

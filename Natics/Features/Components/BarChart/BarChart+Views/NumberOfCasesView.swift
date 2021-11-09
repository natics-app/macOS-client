//
//  NumberOfCasesView.swift
//  Natics
//
//  Created by Peter Lee on 08/11/21.
//

import SwiftUI
import Charts

struct TrendingBarChart: View {
    var body: some View {
        VStack{
            HStack{
                Text("Number of Cases")
                    .fontWeight(.semibold)
                    .font(.system(size: 24))
                Spacer()
                Button(action: {
                       //do action
                }) {
                    Text("Export")
                        .font(.system(size: 13))
                        .fontWeight(.medium)
                }
                .frame(minWidth: 73, minHeight: 28)
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(6)
                .buttonStyle(.plain)

            }
            .padding([.leading, .trailing, .top], 25)
            AnimalBarChartView(entries: Animal.dataEntry(animal: Animal.allCases))
                .padding([.leading, .trailing, .bottom], 10)
        }
    }
}

struct TrendingBarChartView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingBarChart()
    }
}


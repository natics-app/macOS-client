//
//  NumberOfCasesView.swift
//  Natics
//
//  Created by Peter Lee on 08/11/21.
//

import SwiftUI
import Charts

struct TrendingBarChart: View {
    @ObservedObject var viewModel: TrendingAnimalsViewModel
    
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
            AnimalBarChartView(viewModel: viewModel)
                .padding([.leading, .trailing, .bottom], 10)
                .onAppear {
                    viewModel.setAnimalTrending()
                }
        }
    }
}

struct TrendingBarChartView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingBarChart(viewModel: TrendingAnimalsViewModel())
    }
}


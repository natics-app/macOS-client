//
//  PieChartViewCasesCategories.swift
//  Natics
//
//  Created by Peter Lee on 16/11/21.
//

import SwiftUI
import Charts

struct CasesCategoriesChartView: View {
    @ObservedObject var viewModel: CasesCategoriesViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text("Cases Categories")
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
            .padding([.trailing, .top, .leading], 25)
            PieChartCasesCategories(viewModel: viewModel)
        }
        .onAppear {
            viewModel.setCasesCategories()
        }
    }
}

struct CasesCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        MediaChartView(viewModel: ActiveMediaViewModel())
    }
}

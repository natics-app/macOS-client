//
//  TrendsView.swift
//  Natics
//
//  Created by Jackie Leonardy on 01/11/21.
//

import SwiftUI
import Charts
import Combine

struct TrendsView: View {
    @EnvironmentObject var viewModel: DatePickerViewModel
    @ObservedObject var trendingVM: TrendingProvinceViewModel = TrendingProvinceViewModel()
    
    var body: some View {
        ZStack(){
            ScrollView {
                Text("\(viewModel.selection?.rawValue ?? "")")
                HStack {
                    NavigationBarView()
                }
                Spacer()
                HStack {
                    TrendingBarChart()
                    RisingCasesTable()
                }
                HStack {
                    HeatMapView(viewModel: trendingVM)
                }
                .frame(width: nil, height: 400, alignment: .center)
                HStack {
                    MediaChartView()
                    MediaChartView()
                }
                .frame(width: nil, height: 450, alignment: .center)
            }
        }.navigationTitle("")
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigation) {
                Text("Trends")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
            }
            ToolbarItem {
                ToolbarView()
            }
        }
        .padding(24)
        .onReceive(viewModel.$selection) { selectionPublisher in
            if !viewModel.isCustomChosen {
                trendingVM.getTrendingProvinces(selected: selectionPublisher ?? .pastWeek)
            }
        }
        .onReceive(viewModel.$isCustomChosen) { chosen in
            if viewModel.isCustomChosen {
                trendingVM.getTrendingProvinces(startDate: viewModel.customStartDate!, endDate: viewModel.customEndDate!, custom: chosen)
            }
        }
    }
}

struct TrendsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendsView()
            .environmentObject(DatePickerViewModel())
    }
}

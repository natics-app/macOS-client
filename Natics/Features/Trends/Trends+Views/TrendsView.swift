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
    @StateObject var trendingVM: TrendingProvinceViewModel = TrendingProvinceViewModel()
    
    @StateObject var risingCasesVM: TrendingRisingCaseViewModel = TrendingRisingCaseViewModel()
    
    var body: some View {
        ZStack(){
            ScrollView {
                HStack {
                    NavigationBarView()
                }
                Spacer()
                HStack {
                    TrendingBarChart()
                    RisingCasesTable(viewModel: risingCasesVM)
                }
                HStack {
                    HeatMapView(viewModel: trendingVM)
                }
                .frame(width: nil, height: 700, alignment: .center)
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
        .onReceive(viewModel.$selection) {
            selectionPublisher in
            if !viewModel.isCustomChosen {
                trendingVM.getTrendingProvinces(selected: selectionPublisher ?? .pastWeek)
                
                risingCasesVM.getTrendingRisingCases(selection: selectionPublisher ?? .pastWeek)
            }
        }
        .onReceive(viewModel.$isCustomChosen) { chosen in
            if chosen {
                trendingVM.getTrendingProvinces(startDate: viewModel.customStartDate!, endDate: viewModel.customEndDate!)
                
                risingCasesVM.getTrendingRisingCases(startDate: viewModel.customStartDate!, endDate: viewModel.customEndDate!)
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

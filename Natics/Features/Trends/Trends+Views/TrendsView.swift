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
    @StateObject var trendingCasesVM: TrendingAnimalsViewModel = TrendingAnimalsViewModel()
    @StateObject var activeMediaVM: ActiveMediaViewModel = ActiveMediaViewModel()
    @StateObject var casesCategoriesVM = CasesCategoriesViewModel()
    @StateObject var risingCasesVM: TrendingRisingCaseViewModel = TrendingRisingCaseViewModel()
    @StateObject var downloadButtonVM: DownloadShareButtonViewModel = DownloadShareButtonViewModel()
    
    var body: some View {
        ZStack(){
            ScrollView {
                HStack {
                    NavigationBarView()
                }
                Spacer()
                HStack {
                    TrendingBarChart(viewModel: trendingCasesVM)
                    RisingCasesTable(viewModel: risingCasesVM)
                }
                HStack {
                    HeatMapView(viewModel: trendingVM)
                }
                .frame(width: nil, height: 700, alignment: .center)
                HStack {
                    MediaChartView(viewModel: activeMediaVM)
                    CasesCategoriesChartView(viewModel: casesCategoriesVM)
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
                
                trendingCasesVM.getAnimalsTrending(selected: selectionPublisher ?? .pastWeek)
                
                activeMediaVM.getActiveMedia(selected: selectionPublisher ?? .pastWeek)
                
                casesCategoriesVM.getCasesCategories(selected: selectionPublisher ?? .pastWeek)
                
                risingCasesVM.getTrendingRisingCases(selection: selectionPublisher ?? .pastWeek)
                
            }
        }
        .onReceive(viewModel.$isCustomChosen) { chosen in
            if chosen {
                trendingVM.getTrendingProvinces(startDate: viewModel.customStartDate!, endDate: viewModel.customEndDate!)
                
                trendingCasesVM.getAnimalsTrending(startDate: viewModel.customStartDate!, endDate: viewModel.customEndDate!)
                
                activeMediaVM.getActiveMedia(startDate: viewModel.customStartDate!, endDate: viewModel.customEndDate!)
                
                casesCategoriesVM.getCasesCategories(startDate: viewModel.customStartDate!, endDate: viewModel.customEndDate!)
                
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

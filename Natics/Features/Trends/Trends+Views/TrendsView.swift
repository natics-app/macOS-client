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
    @StateObject var trendingCases: TrendingAnimalsViewModel = TrendingAnimalsViewModel()
    @StateObject var activeMedia: ActiveMediaViewModel = ActiveMediaViewModel()
    @StateObject var casesCategories:
        CasesCategoriesViewModel = CasesCategoriesViewModel()
    
    
    var body: some View {
        ZStack(){
            ScrollView {
                Text("\(viewModel.selection?.rawValue ?? "")")
                HStack {
                    NavigationBarView()
                }
                Spacer()
                HStack {
                    TrendingBarChart(viewModel: activeMedia)
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
            if viewModel.isCustomChosen {
                trendingVM.getTrendingProvinces(startDate: viewModel.customStartDate!, endDate: viewModel.customEndDate!)
                
                trendingCases.getActiveMedia(startDate: viewModel.customStartDate!, endDate: viewModel.customEndDate!)
                
            } else {
                trendingVM.getTrendingProvinces(selected: selectionPublisher ?? .pastWeek)
                
                trendingCases.getAnimalsTrending(selected: selectionPublisher ?? .pastWeek)
                
                activeMedia.getActiveMedia(selected: selectionPublisher ?? .pastWeek)
                
                casesCategories.getCasesCategories(selected: selectionPublisher ?? .pastWeek)
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

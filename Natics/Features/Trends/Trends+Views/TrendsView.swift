//
//  TrendsView.swift
//  Natics
//
//  Created by Jackie Leonardy on 01/11/21.
//

import SwiftUI
import Charts

struct TrendsView: View {
    @EnvironmentObject var viewModel: DatePickerViewModel
    @StateObject var trendingVM: TrendingProvinceViewModel = TrendingProvinceViewModel()
    
    var body: some View {
        ZStack(){
            ScrollView {
                HStack {
                    NavigationBarView()
                }
                Spacer()
                HStack {
                    TrendingBarChart()
                    RisingCasesTable()
                }
                HStack {
                    HeatMapView()
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
        .onAppear {
            trendingVM.getTreningProvinces()
        }
    }
}

struct TrendsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendsView()
            .environmentObject(DatePickerViewModel())
    }
}

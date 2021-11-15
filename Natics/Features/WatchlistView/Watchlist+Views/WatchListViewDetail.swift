//
//  WatchlistView.swift
//  Natics
//
//  Created by Christian Adiputra on 10/11/21.
//

import SwiftUI
import Charts

struct WatchListViewDetail: View {
    let id: Int
    @EnvironmentObject var viewModel: DatePickerViewModel
    @ObservedObject var watchListViewModel: WatchListViewModel
    
    init(id: Int) {
        self.id = id
        self.watchListViewModel = WatchListViewModel(id: id)
    }
    
    var body: some View {
        ScrollView {
            VStack(){
                HStack {
                    NavigationBarView()
                }
                HStack {
                    GeometryReader { geo in
                        HStack {
                            HighlightCard(name: "Total Cases", content: watchListViewModel.totalCases)
                                .frame(width: geo.size.width * 0.5)
                                .background(Color.colorTheme.MCLightGrey)
                                .foregroundColor(Color.colorTheme.MCBlack)
                                .cornerRadius(10)
                                .redacted(reason: watchListViewModel.doneLoadingTotalCases ? [] : .placeholder)
                                .onAppear {
                                    watchListViewModel.getTotalCases()
                                }
                                .environmentObject(watchListViewModel.totalCases)
                            
                            HighlightCard(name: "Rank", content: watchListViewModel.rank)
                                .frame(width: geo.size.width * 0.5)
                                .background(Color.colorTheme.MCLightGrey)
                                .foregroundColor(Color.colorTheme.MCBlack)
                                .cornerRadius(10)
                                .redacted(reason: watchListViewModel.doneLoadingRank ? [] : .placeholder)
                                .onAppear {
                                    watchListViewModel.getRank()
                                }
                                .environmentObject(watchListViewModel.rank)
                        }
                        
                    }.frame(height: 150, alignment: .leading)
                }
                GeometryReader { geo in
//                    HeatMapView()
//                        .frame(width: geo.size.width)
                }
                .frame(height: 520, alignment: .leading)
                
                
                GeometryReader { geo in
                    HStack {
                        MediaChartView()
                            .frame(width: geo.size.width * 0.5)
                            .background(Color.colorTheme.MCLightGrey)
                            .foregroundColor(Color.colorTheme.MCBlack)
                            .cornerRadius(10)
                        Spacer()
                        MediaChartView()
                            .frame(width: geo.size.width * 0.5)
                            .background(Color.colorTheme.MCLightGrey)
                            .foregroundColor(Color.colorTheme.MCBlack)
                            .cornerRadius(10)
                    }

                }
                .frame(height: 420, alignment: .leading)
                CasesTable()
                Spacer()
            }
        }
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigation) {
                Text("Watchlist")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
            }
            ToolbarItem {
                ToolbarView()
            }
        }
        .padding(24)
    }
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListViewDetail(id: 26)
            .environmentObject(DatePickerViewModel())
    }
}

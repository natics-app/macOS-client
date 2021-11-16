//
//  BarChart.swift
//  Natics
//
//  Created by Peter Lee on 08/11/21.
//

import SwiftUI
import Charts

struct AnimalBarChartView: NSViewRepresentable {
    @ObservedObject var viewModel: ActiveMediaViewModel
    
    func makeNSView(context: Context) -> BarChartView {
        return BarChartView()
    }
    
    func updateNSView(_ nsView: BarChartView, context: Context) {
        let dataSet = BarChartDataSet(entries: viewModel.activeMediaList)
        nsView.legend.enabled = false
        nsView.noDataText = "No data"
        nsView.data = BarChartData(dataSet: dataSet)
        nsView.rightAxis.enabled = false
        
        nsView.setVisibleXRangeMaximum(10)
        nsView.setScaleEnabled(false) //prevent zoom in
        
        nsView.extraBottomOffset = 30
        formatDataSet(dataSet: dataSet)
        formatLeftAxis(leftAxis: nsView.leftAxis)
        formatXAxis(xAxis: nsView.xAxis)
    }
    
    func formatDataSet(dataSet: BarChartDataSet){
        dataSet.colors = [NSUIColor(red: 0.267, green: 0.599, blue: 0.228, alpha: 1)]
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        dataSet.valueFormatter = DefaultValueFormatter(formatter: formatter)
    }
    
    func formatLeftAxis(leftAxis: YAxis){
        leftAxis.axisMinimum = 0
    }
    
    func formatXAxis(xAxis: XAxis){
        xAxis.labelPosition = .bottom
        xAxis.enabled = true
        xAxis.valueFormatter = IndexAxisValueFormatter(values: viewModel.activeMediaNames)
        xAxis.labelCount = 10
        xAxis.wordWrapEnabled = true
        

    }
    
    func formatLegend(legend: Legend){
    }
}

//
struct TransactionBarChartView_previews: PreviewProvider {
    static var previews: some View {
        AnimalBarChartView(viewModel: ActiveMediaViewModel())
    }
}


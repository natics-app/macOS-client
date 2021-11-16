//
//  BarChart.swift
//  Natics
//
//  Created by Peter Lee on 08/11/21.
//

import SwiftUI
import Charts

struct AnimalBarChartView: NSViewRepresentable {
    @ObservedObject var viewModel: TrendingAnimalsViewModel
    
    func makeNSView(context: Context) -> BarChartView {
        return BarChartView()
    }
    
    func updateNSView(_ nsView: BarChartView, context: Context) {
        let dataSet = BarChartDataSet(entries: viewModel.trendingAnimalList)
        dataSet.label = "Transaction"
        nsView.legend.enabled = false
        nsView.noDataText = "No data"
        nsView.data = BarChartData(dataSet: dataSet)
        nsView.rightAxis.enabled = false
        nsView.setScaleEnabled(false)
        formatDataSet(dataSet: dataSet)
        formatLeftAxis(leftAxis: nsView.leftAxis)
        formatXAxis(xAxis: nsView.xAxis)
    }
    
    func formatDataSet(dataSet: BarChartDataSet) {
        dataSet.colors = [NSColor(.accentColor)]
        dataSet.valueColors = [NSColor(.primary)]
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        dataSet.valueFormatter = DefaultValueFormatter(formatter: formatter)
    }
    
    func formatRightAxis(rightAxis: YAxis) {
        rightAxis.labelTextColor = NSColor(.primary)
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        rightAxis.valueFormatter = DefaultAxisValueFormatter(formatter: formatter)
        rightAxis.axisMinimum = 0
        rightAxis.drawGridLinesEnabled = false
    }
    
    func formatLeftAxis(leftAxis: YAxis) {
        leftAxis.enabled = false
        leftAxis.axisMinimum = 0
    }
    
    func formatXAxis (xAxis: XAxis) {
        xAxis.valueFormatter = IndexAxisValueFormatter(values: viewModel.trendingAnimalNames)
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = NSColor(.primary)
        xAxis.drawGridLinesEnabled = false
        xAxis.granularity = 1
        xAxis.labelCount = 8
    }
}

struct TransactionBarChartView_previews: PreviewProvider {
    static var previews: some View {
        AnimalBarChartView(viewModel: TrendingAnimalsViewModel())
    }
}


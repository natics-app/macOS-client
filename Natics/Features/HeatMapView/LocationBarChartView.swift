//
//  LocationBarChartView.swift
//  MacOSMap
//
//  Created by Jackie Leonardy on 28/10/21.
//

import SwiftUI
import Charts

struct LocationBarChartView: NSViewRepresentable {
    @ObservedObject var viewModel: TrendsViewModel
    
    func makeNSView(context: Context) -> HorizontalBarChartView {
        return HorizontalBarChartView()
    }
    
    func updateNSView(_ nsView: HorizontalBarChartView, context: Context) {
        let dataSet = BarChartDataSet(entries: viewModel.locationList)
        dataSet.label = "Location"
        nsView.noDataText = "No Data"
        nsView.data = BarChartData(dataSet: dataSet)
        
        //Custom Chart Functions
        nsView.scaleXEnabled = false
        nsView.scaleYEnabled = false
        nsView.legend.enabled = false
        nsView.highlightPerTapEnabled = false
        nsView.highlightPerDragEnabled = false
        
        //Chart Formatting
        nsView.barData?.barWidth = 0.5
        nsView.zoom(scaleX: 0.5, scaleY: 1, x: 0, y: 0)
        
        formatDataSet(dataSet: dataSet)
        formatRightAxis(rightAxis: nsView.rightAxis)
        formatLeftAxis(leftAxis: nsView.leftAxis)
        formatXAxis(xAxis: nsView.xAxis)
        
        nsView.notifyDataSetChanged()
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
        xAxis.valueFormatter = IndexAxisValueFormatter(values: viewModel.locationNames)
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = NSColor(.primary)
        xAxis.drawGridLinesEnabled = false
        xAxis.granularity = 1
        xAxis.labelCount = 10
    }
}

//
//  PieChart.swift
//  Natics
//
//  Created by Peter Lee on 08/11/21.
//

import SwiftUI

import SwiftUI
import Charts

struct PieChart: NSViewRepresentable {
    
    var entries: [PieChartDataEntry]
    let pieChart = PieChartView()
    func makeNSView(context: Context) -> PieChartView {
        pieChart.delegate = context.coordinator
        return pieChart
    }
    
    func updateNSView(_ nsView: PieChartView, context: Context) {
        let dataSet = PieChartDataSet(entries: entries)
//        dataSet.colors = ChartColorTemplates.colorful()
        dataSet.colors = [NSUIColor(red: 1, green: 0.369, blue: 0.341, alpha: 1), NSUIColor(red: 0.235, green: 0.514, blue: 0.969, alpha: 1), NSUIColor(red: 0.698, green: 0.384, blue: 0.918, alpha: 1), NSUIColor(red: 0.973, green: 0.839, blue: 0.294, alpha: 1), NSUIColor(red: 0.506, green: 0.816, blue: 0.98, alpha: 1)]
        let pieChartData = PieChartData(dataSet: dataSet)
        nsView.data = pieChartData
        configureChart(nsView)
        formatCenter(nsView)
        formatDescription(nsView.chartDescription!)
        formatLegend(nsView.legend)
        formatDataSet(dataSet)
        nsView.notifyDataSetChanged()
    }
    
    class Coordinator: NSObject, ChartViewDelegate {
        var parent: PieChart
        init(parent: PieChart){
            self.parent = parent
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func configureChart(_ pieChart: PieChartView){
//        pieChart.animate(xAxisDuration: 0.5, easingOption: .easeInOutCirc)
        pieChart.drawEntryLabelsEnabled = false
    }
    
    func formatCenter(_ pieChart: PieChartView){
        pieChart.drawHoleEnabled = false
    }
    
    func formatDescription(_ description: Description) {
        
    }
    
    func formatLegend(_ legend: Legend) {
        pieChart.legend.formSize = 12
        pieChart.legend.orientation = .vertical
        pieChart.legend.yEntrySpace = 5
        pieChart.legend.horizontalAlignment = .right
        pieChart.legend.verticalAlignment = .center
        pieChart.legend.textColor = NSColor(Color.colorTheme.MCBlack)

        
    }
    
    func formatDataSet(_ dataSet: ChartDataSet) {
        dataSet.drawValuesEnabled = false
    }
}

struct PieChart_previews: PreviewProvider {
    static var previews: some View {
        PieChart(entries: Media.entriesForMedia(Media.allMedia))
            .frame(height: 400)
            .padding()
    }
}


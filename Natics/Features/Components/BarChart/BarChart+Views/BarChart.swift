//
//  BarChart.swift
//  Natics
//
//  Created by Peter Lee on 08/11/21.
//

import SwiftUI
import Charts

struct AnimalBarChartView: NSViewRepresentable {
    let entries: [BarChartDataEntry]
    func makeNSView(context: Context) -> BarChartView {
        return BarChartView()
    }
    
    func updateNSView(_ nsView: BarChartView, context: Context) {
        let dataSet = BarChartDataSet(entries: entries)
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
//        xAxis.valueFormatter = IndexAxisValueFormatter(values: Transaction.months)
        xAxis.labelPosition = .bottom
        xAxis.enabled = true
        
        var animalArr: [String] = []
        for i in Animal.allCases{
            animalArr.append(i.animalName)
        }
        xAxis.valueFormatter = IndexAxisValueFormatter(values: animalArr)
        xAxis.labelCount = 10
        xAxis.wordWrapEnabled = true
        

    }
    
    func formatLegend(legend: Legend){
    }
}

//
struct TransactionBarChartView_previews: PreviewProvider {
    static var previews: some View {
        AnimalBarChartView(entries: Animal.dataEntry(animal: Animal.allCases))
    }
}


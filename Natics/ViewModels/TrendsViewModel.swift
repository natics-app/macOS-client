//
//  File.swift
//  MacOSMap
//
//  Created by Jackie Leonardy on 28/10/21.
//

import Foundation
import Charts

class TrendsViewModel: ObservableObject {
    @Published var isProvinceLoading = true
    @Published var isAnimalLoading = true
    
    @Published var animalSelected: Double = 0 {
        didSet {
            setLocationTrend(isAnimalSelected: isAnimalSelected, animalSelected: animalSelected)
        }
    }
    @Published var isAnimalSelected: Bool = false {
        didSet {
            setLocationTrend(isAnimalSelected: isAnimalSelected, animalSelected: animalSelected)
        }
    }
    
//    var animalTrend = [AnimalTrend]() {
//        // When variable of array appended, create Animal List
//        didSet {
//            self.animalNames = animalTrend.map { trend in
//                trend.animalName
//            }
//            self.animalList = animalTrend.map { trend in
//                if let safeTotalCase = Double(trend.totalCase) {
//                    return BarChartDataEntry(x: Double(trend.index), y: safeTotalCase)
//                }
//                return BarChartDataEntry()
//            }
//            csvString = generateCSV()
//        }
//    }
    
//    var allProvinceTrends = [ProvinceTrend]() {
//        didSet {
//            setLocationTrend(isAnimalSelected: isAnimalSelected, animalSelected: animalSelected)
//            csvString = generateCSV()
//        }
//    }
    
    @Published var animalNames = [String]()
    @Published var animalList = [BarChartDataEntry]()
    
    @Published var csvString: String = ""
    
    func generateCSV() -> String {
        // String CSV Generator
        var stringCSV =  " ,DAFTAR HEWAN, \nNo.,Nama Hewan,Jumlah Kasus\n"
        
        // List of Animals
//        for (index, animal) in animalTrend.enumerated() {
//            stringCSV.append("\(index+1),\(animal.animalName),\(animal.totalCase)\n")
//            for location in animal.provinceTrend {
//                stringCSV.append(" ,\(location.provinceName),\(location.totalProvince)\n")
//            }
//        }
        
        stringCSV.append(" , , \n ,DAFTAR PROVINSI, \n")
        stringCSV.append("No.,Nama Provinsi, Jumlah Kasus\n")
        
        // List of province
//        for (index, prov) in allProvinceTrends.enumerated() {
//            stringCSV.append("\(index+1),\(prov.provinceName),\(prov.totalProvince)\n")
//        }
        
        return stringCSV
    }
    
    // MARK: - Dari LocationChartViewModel
    @Published var locationNames = [String]()
    @Published var locationList = [BarChartDataEntry]()
    
    // Needs to be refactored!!!!!!!!!!
    func setLocationTrend(isAnimalSelected: Bool, animalSelected: Double) {
        if !isAnimalSelected {
//            self.locationNames = allProvinceTrends.map { trend in
//                trend.provinceName
//            }
//            self.locationList = allProvinceTrends.map { trend in
//                if let safeTotal = Double(trend.totalProvince) {
//                    return BarChartDataEntry(x: Double(trend.index), y: safeTotal)
//                }
//                return BarChartDataEntry()
//            }
        } else {
            let safeIndex = Int(animalSelected)
//            let selectedAnimalProvTrend = animalTrend[safeIndex].provinceTrend
//            self.locationNames = selectedAnimalProvTrend.map { trend in
//                trend.provinceName
//            }
//            self.locationList = selectedAnimalProvTrend.map { trend in
//                if let safeTotal = Double(trend.totalProvince) {
//                    return BarChartDataEntry(x: Double(trend.index), y: safeTotal)
//                }
//                return BarChartDataEntry()
//            }
        }
    }
    
    func loadData() {
        // Fetch the Animal Trends
        self.isProvinceLoading = true
        self.isAnimalLoading = true
    }
}

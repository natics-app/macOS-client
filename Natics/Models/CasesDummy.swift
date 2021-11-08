//
//  CasesDummy.swift
//  Natics
//
//  Created by Peter Lee on 08/11/21.
//

import SwiftUI
import Charts

struct Animal {
    var animalName: String
    var numberOfCases: Double
    var position: Double
    
    static func dataEntry(animal: [Animal]) -> [BarChartDataEntry]{
        let data = animal.sorted(by: { $0.numberOfCases > $1.numberOfCases})
        return data.map{BarChartDataEntry(x: $0.position, y: $0.numberOfCases)}
    }
    
    
    static var allCases: [Animal]{
        [
            Animal(animalName: "Jackie Leonardy\nChristian Adiputra", numberOfCases: 8, position: 0),
            Animal(animalName: "Penyu", numberOfCases: 5, position: 1),
            Animal(animalName: "Monyet", numberOfCases: 6, position: 2),
            Animal(animalName: "Hiu", numberOfCases: 8, position: 5),
            Animal(animalName: "Kelinci", numberOfCases: 3, position: 4),
            Animal(animalName: "Burung", numberOfCases: 1, position: 6),
            Animal(animalName: "Gorilla", numberOfCases: 6, position: 7),
            Animal(animalName: "Panda", numberOfCases: 8, position: 8),
            Animal(animalName: "Beruang", numberOfCases: 10, position: 9),
            Animal(animalName: "Macan", numberOfCases: 4, position: 3)
        ]
    }
}

//
//  MediaDummy.swift
//  Natics
//
//  Created by Peter Lee on 08/11/21.
//
import SwiftUI
import Charts

struct Media {
    var mediaName: String
    var mediaNumber: Int
    
    static func entriesForMedia(_ media: [Media]) -> [PieChartDataEntry] {
        let data = media
        return data.map{PieChartDataEntry(value: Double($0.mediaNumber), label: $0.mediaName)}
    }
    
    static var allMedia:[Media] {
        [
            Media(mediaName: "CNN", mediaNumber: 4),
            Media(mediaName: "Kompas", mediaNumber: 6),
            Media(mediaName: "BBC", mediaNumber: 8),
            Media(mediaName: "Medan News", mediaNumber: 1),
            Media(mediaName: "Singkawang News", mediaNumber: 10)
        ]
    }
}

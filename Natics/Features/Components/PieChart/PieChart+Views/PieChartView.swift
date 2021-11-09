//
//  PieChartView.swift
//  Natics
//
//  Created by Peter Lee on 08/11/21.
//

import SwiftUI
import Charts

struct MediaChartView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Active Media")
                    .fontWeight(.semibold)
                    .font(.system(size: 24))
                Spacer()
                Button(action: {
                       //do action
                }) {
                    Text("Export")
                        .font(.system(size: 13))
                        .fontWeight(.medium)
                }
                .frame(minWidth: 73, minHeight: 28)
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(6)
                .buttonStyle(.plain)

            }
            .padding([.trailing, .top, .leading], 25)
            PieChart(entries: Media.entriesForMedia(Media.allMedia))
        }
    }
}

struct MediaChartView_Previews: PreviewProvider {
    static var previews: some View {
        MediaChartView()
    }
}

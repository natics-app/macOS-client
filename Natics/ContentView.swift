//
//  ContentView.swift
//  Natics
//
//  Created by Puras Handharmahua on 26/10/21.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 0, longitude: 116.499023),
            span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
        )
    @StateObject var viewModel = TrendsViewModel()

    @State private var lineCoordinates = [

        // Steve Jobs theatre
        CLLocationCoordinate2D(latitude: 122.04731, longitude:  -4.770176),

        // Caffè Macs
        CLLocationCoordinate2D(latitude: 37.336083, longitude: -122.007356),

        // Apple wellness center
        CLLocationCoordinate2D(latitude: 37.336901, longitude:  -122.012345)
      ]
//    @State private var lineCoordinates = HeatMapModel.shared.getMap()

    
    /// <#Description#>
    var body: some View {
        VStack {
            GeometryReader { geo in
                GroupBox {
                    VStack(alignment: .center){
                        HStack(){
                            VStack(alignment: .leading, spacing: 0){
                                Text("Interest by Region")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.accentColor)
                                Text("Summary based on the total number of cases")
                                    .font(.body)
                                    .foregroundColor(.secondary)
                            }.padding(.leading, 10)
                            Spacer()
                            ExportButton {
                                
                            }.padding(.trailing, 10)
                            
                        }
                        .padding(10)
                        HStack() {
                            HStack {
                                Spacer()
                                    MapCompat(coordinateRegion: $region, lineCoordinates: lineCoordinates)
                                Spacer()
                            }
                        .background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
                        .frame(width: geo.size.width * 0.60)
                
                            HStack {
                                Spacer()
                                LocationBarChartView(viewModel: viewModel)
                                Spacer()
                        }
                            .background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
                        }                        .padding(10)
                }.background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
                    .cornerRadius(10)
                    .frame(width: geo.size.width * 1)

                }
            }.padding(10)
        }.navigationTitle("Trends")
            .padding(.bottom, 20)
            .padding(.top, 20)
            .padding(.leading, 25)
            .padding(.trailing, 25)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

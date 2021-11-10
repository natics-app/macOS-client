//
//  HeatMapView.swift
//  Natics
//
//  Created by Jackie Leonardy on 07/11/21.
//

import SwiftUI
import MapKit

struct HeatMapView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 0, longitude: 116.499023),
            span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
        )
    @StateObject var viewModel = TrendsViewModel()
    @State var overImg = false
    var mouseLocation: NSPoint { NSEvent.mouseLocation }
    
    @State private var point1: NSPoint = .zero
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                GroupBox {
                    VStack(alignment: .center){
                        HStack(){
                            VStack(alignment: .leading, spacing: 0){
                                HStack(spacing: 8) {
                                    Text("Interest by Region")
                                        .font(.system(size: 24))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.accentColor)
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "info.circle").resizable()
                                            .frame(width: 18, height: 18, alignment: .center)
                                    }.buttonStyle(PlainButtonStyle())

                                }
                            }.padding(.leading, 10)
                            Spacer()
                            ExportButton {
                                
                            }.padding(.trailing, 10)
                            
                        }
                        .padding(10)
                        HStack() {
                            VStack {
                                ZStack(alignment: .center) {
                                    MapCompat(coordinateRegion: $region)
                                    .trackingMouse { location in
                                                            self.point1 = location }
                                    .clipped()
                                    Rectangle()
                                                    .fill(Color.red)
                                                    .frame(width: 10, height: 10)
                                }
                                    
                                
                                Text("\(String(format: "X = %.0f, Y = %.0f", self.point1.x, self.point1.y))")
                                HStack(alignment: .center, spacing: 16) {
                                    MapLegendIndicator(legendColor: Color.red, legendLabel: "Sangat Rawan (>300)")
                                    MapLegendIndicator(legendColor: Color.orange, legendLabel: "Rawan (100-299)")
                                    MapLegendIndicator(legendColor: Color.yellow, legendLabel: "Cukup Rawan (1-99)")
                                    MapLegendIndicator(legendColor: Color.green, legendLabel: "Tidak Rawan")
                                }
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
                .onAppear(perform: {
                                NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) {
                                    if overImg {
                                        print("mouse: \(self.mouseLocation.x) \(self.mouseLocation.y)")
                                    }
                                    return $0
                                }
                            })
        }.navigationTitle("Trends")
            .padding(.bottom, 20)
            .padding(.top, 20)
            .padding(.leading, 25)
            .padding(.trailing, 25)
        
        
    }
}

struct HeatMapView_Previews: PreviewProvider {
    static var previews: some View {
        HeatMapView()
    }
}

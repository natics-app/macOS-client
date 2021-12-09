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
    @ObservedObject var viewModel : TrendingProvinceViewModel
    
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 0, longitude: 116.499023),
            span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
        )
    
    @State var overImg = false
    @State private var touchPoint: NSPoint = .zero
    
    var mapCompat: some View {
        MapCompat(coordinateRegion: $region, touchPoint: $touchPoint, viewModel: viewModel)
        .trackingMouse { location in
            self.touchPoint = location
        }
        .clipped()
    }
    
    var mouseLocation: NSPoint { NSEvent.mouseLocation }
    
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
                                guard let data = mapCompat.renderAsImage() else {
                                    print("data nil")
                                    return
                                }
                                NSSavePanel.saveImage(data) { result in

                                }
                            }
                            .frame(width: 120, height: 28).padding(.trailing, 10)
                        }
                        .padding(10)
                        
                        HStack() {
                            VStack {
                                ZStack(alignment: .topLeading) {
                                    mapCompat
//                                    if viewModel.isIntersect {
                                        HeatMapRegionHighlight()
                                            .clipped()
                                            .offset(x: self.touchPoint.x, y:
                                                        self.touchPoint.y)
//                                    }
                                }
                                Text("\(String(format: "X = %.0f, Y = %.0f", self.touchPoint.x, self.touchPoint.y))")
                                HStack(alignment: .center, spacing: 16) {
                                    MapLegendIndicator(legendColor: Color.red, legendLabel: "Very Vurnerable (>300)")
                                    MapLegendIndicator(legendColor: Color.orange, legendLabel: "Vurnerable (100-299)")
                                    MapLegendIndicator(legendColor: Color.yellow, legendLabel: "Quiet Vurnerable (1-99)")
                                    MapLegendIndicator(legendColor: Color.green, legendLabel: "Not Vurnerable")
                                }
                            }
                        .background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
                        .frame(width: geo.size.width * 0.60)
                
                            HStack {
                                Spacer()
                                TrendingLocationBarChartView(viewModel: viewModel)
                                Spacer()
                            }
                            .background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
                        }                        .padding(24)
                }.background(colorScheme == .light ? Color.white : Color(red: 0.2, green: 0.2, blue: 0.2))
                    .cornerRadius(10)
                    .frame(width: geo.size.width * 1)

                }
                .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
            }.padding(10)
            .onAppear(perform: {
                viewModel.setProvinceTrending()
            })
        }
        .padding([.bottom, .top], 20)
    }
}

struct HeatMapView_Previews: PreviewProvider {
    static var previews: some View {
        HeatMapView(viewModel: TrendingProvinceViewModel())
    }
}

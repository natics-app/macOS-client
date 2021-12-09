//
//  NumberOfCasesView.swift
//  Natics
//
//  Created by Peter Lee on 08/11/21.
//

import SwiftUI
import Charts

struct TrendingBarChart: View {
    @ObservedObject var viewModel: TrendingAnimalsViewModel
    @StateObject var downloadButtonVM: DownloadShareButtonViewModel = DownloadShareButtonViewModel()
    
    @ViewBuilder
    var barView: some View {
        AnimalBarChartView(viewModel: viewModel)
            .padding([.leading, .trailing, .bottom], 10)
            .onAppear {
                viewModel.setAnimalTrending()
            }
    }
    
    var textView: some View {
            Text("Hello, SwiftUI")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("Number of Cases")
                    .fontWeight(.semibold)
                    .font(.system(size: 24))
                    .background(Color.orange)
                Spacer()
                Button(action: {
                    viewModel.renderImage(view: AnyView(self.body))
                    
                    NSSavePanel.saveImage(viewModel.imageData!
                    ) { result in

                    }

                }) {
                    Text("Exportsss")
                        .font(.system(size: 13))
                        .fontWeight(.medium)
                }
                .frame(minWidth: 73, minHeight: 28)
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(6)
                .buttonStyle(.plain)

            }
            .padding([.leading, .trailing, .top], 25)
           barView
        
        }
        .onAppear {
            viewModel.setAnimalTrending()
        }
    }
}

struct TrendingBarChartView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingBarChart(viewModel: TrendingAnimalsViewModel())
    }
}


//
//  NavigationBarView.swift
//  Natics
//
//  Created by Jackie Leonardy on 02/11/21.
//

import SwiftUI

struct NavigationBarView: View {
    @StateObject var sideBarViewModel = SideBarViewModel()
    @EnvironmentObject var viewModel: DatePickerViewModel
    var placeHolder = "Past Week"
    
    @State var value = ""
        var body: some View {
            
            HStack {
                HStack(spacing: 24) {
                    HStack(spacing: 4) {
                    Button {
                        sideBarViewModel.showPopover()
                        viewModel.closePicker()
                    } label: {
                        HStack(alignment: .center){
                            Image(systemName: "calendar")
                            Text(!viewModel.isEverClicked ? placeHolder :
                                    (viewModel.isCustomChosen ? viewModel.returnCustomRange() : viewModel.selection!.getCalculatedYear()))
                                .font(Font.custom("SF Pro Text", size: 10))
                            Spacer()
                        }
                        .frame(width: 125)
                    }
                    .opacity(0.85)
                    .popover(isPresented: $sideBarViewModel.customTimeRangePopOver, arrowEdge: .bottom) {
                        if viewModel.isCustomTapped {
                            DatePickerView(startDate: $viewModel.filterStartDate, endDate: $viewModel.filterEndDate, sideBarViewModel: sideBarViewModel)
                        } else {
                            DatePickerPopOverView(viewModel: self.viewModel, sideBarViewModel: self.sideBarViewModel)
                        }
                    }
                }
                    Text("Updated Today, 26 Oct 2021 00:00")
                }
                Spacer()
                HStack(spacing: 16) {
                    SharingButton(label: "Share") {
                        
                    }
                    SharingButton(label: "Export All") {
                        
                    }
                }
            }
        }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .environmentObject(DatePickerViewModel())
    }
}

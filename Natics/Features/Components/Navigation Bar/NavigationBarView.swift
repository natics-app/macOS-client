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
    
    @State var value = ""
        var body: some View {
            HStack(spacing: 0) {
                
                Button {
                    sideBarViewModel.showPopover()
                    viewModel.closePicker()
                } label: {
                    HStack(){
                        Image(systemName: "calendar")
                        Text(viewModel.selection!.rawValue)
                            .font(.system(size: 11))
                            .fontWeight(.medium)
                    }
                }.padding([.leading, .trailing], 8)
                .opacity(0.85)
                .popover(isPresented: $sideBarViewModel.customTimeRangePopOver, arrowEdge: .bottom) {
                    if viewModel.isCustomTapped {
                        DatePickerView(startDate: $viewModel.filterStartDate, endDate: $viewModel.filterEndDate)
                    } else {
                        DatePickerPopOverView(viewModel: self.viewModel)
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

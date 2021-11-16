//
//  CasesView.swift
//  Natics
//
//  Created by Jackie Leonardy on 01/11/21.
//

import SwiftUI

struct CasesView: View {
    @EnvironmentObject var viewModel: DatePickerViewModel
    @StateObject var casesViewModel: CasesViewModel =  CasesViewModel()
    
    var body: some View {
        VStack(){
            Text("\(viewModel.selection?.rawValue ?? "")")
            HStack {
                NavigationBarView()
            }
            CasesTable(casesViewModel: casesViewModel)
            Spacer()
        }.navigationTitle("")
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigation) {
                Text("Cases")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
            }
            ToolbarItem {
                ToolbarView()
            }
        }
        .padding(24)
        .onReceive(viewModel.$selection) { selectionPublisher in
            if !viewModel.isCustomChosen {
                casesViewModel.getAllCases(selection: selectionPublisher ?? .pastWeek)
            }
        }
        .onReceive(viewModel.$isCustomChosen) { chosen in
            if chosen {
                casesViewModel.getAllCases(startDate: viewModel.customStartDate!, endDate: viewModel.customEndDate!)
            }
        }
    }
}

struct CasesView_Previews: PreviewProvider {
    static var previews: some View {
        CasesView()
            .environmentObject(DatePickerViewModel())
    }
}

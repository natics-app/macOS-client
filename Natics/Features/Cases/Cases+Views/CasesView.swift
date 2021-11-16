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
        
    }
}

struct CasesView_Previews: PreviewProvider {
    static var previews: some View {
        CasesView()
            .environmentObject(DatePickerViewModel())
    }
}

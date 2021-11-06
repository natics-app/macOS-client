//
//  TrendsView.swift
//  Natics
//
//  Created by Jackie Leonardy on 01/11/21.
//

import SwiftUI

struct TrendsView: View {
    @EnvironmentObject var viewModel: DatePickerViewModel
    
    var body: some View {
        VStack(){
            HStack {
                NavigationBarView()
            }
            Spacer()
        }.navigationTitle("")
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigation) {
                Text("Trends")
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

struct TrendsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendsView()
            .environmentObject(DatePickerViewModel())
    }
}

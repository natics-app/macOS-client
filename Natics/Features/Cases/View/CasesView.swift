//
//  CasesView.swift
//  Natics
//
//  Created by Jackie Leonardy on 01/11/21.
//

import SwiftUI

struct CasesView: View {
    var body: some View {
        VStack {
            DatePickerView(startDate: .constant(Date()-7), endDate: .constant(Date()))
            Text("Cases Dashboard")
        }.navigationTitle("")
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigation) {
                Text("Cases")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
            }
            ToolbarItem {
                ToolbarView().padding(.top, 27)
            }
        }
    }
}

struct CasesView_Previews: PreviewProvider {
    static var previews: some View {
        CasesView()
    }
}

//
//  CasesTable.swift
//  Natics
//
//  Created by Christian Adiputra on 09/11/21.
//

import SwiftUI

struct CasesTable: View {
    
    @ObservedObject var casesViewModel: CasesViewModel
    @Binding var isToggle : Bool
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack(alignment: .leading, spacing: 0) {
                CasesTableHeader()
                ScrollView(.vertical) {
                    LazyVStack(alignment: .leading, spacing: 0) {
                
                        ForEach(casesViewModel.cases, id: \.id) { news in
                            CasesTableRow(rowcase: news, rowindex: news.id, isShow: $isToggle)
                                .frame(width: 1613 ,height: 40, alignment: .leading)
                                .background(Color.white)
                       }
                    }
                    .redacted(reason: casesViewModel.doneLoading ? [] : .placeholder)
                }
            }
            
        }
    }
}

struct CasesTable_Previews: PreviewProvider {
    static var previews: some View {
        CasesTable(casesViewModel: CasesViewModel(), isToggle: .constant(false))
    }
}

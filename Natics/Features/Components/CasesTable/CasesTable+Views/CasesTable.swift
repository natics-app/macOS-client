//
//  CasesTable.swift
//  Natics
//
//  Created by Christian Adiputra on 09/11/21.
//

import SwiftUI

struct CasesTable: View {
    
    @StateObject var casesViewModel: CasesViewModel = CasesViewModel()
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack(alignment: .leading, spacing: 0) {
                CasesTableHeader()
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 0) {
                
                        ForEach(casesViewModel.cases, id: \.id) { news in
                            CasesTableRow(rowcase: news, rowindex: news.id)
                                .frame(width: 1613 ,height: 40, alignment: .leading)
                                .background(Color.white)
                       }
                    }
                }
            }
            
        }
    }
}

struct CasesTable_Previews: PreviewProvider {
    static var previews: some View {
        CasesTable()
    }
}

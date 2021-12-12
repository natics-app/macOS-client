//
//  SearchBarRow.swift
//  Natics
//
//  Created by Jackie Leonardy on 11/11/21.
//

import SwiftUI

struct SearchBarRow: View {
    
    @State private var onHover = false
    @Binding var temporaryField : [String]
    @Binding var distinctField : [String]
    
    var name : String
    
    var body: some View {
        HStack {
            Text(name)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(8)
            .foregroundColor(onHover ? Color.colorTheme.MCDarkGrey : Color.colorTheme.MCLightGrey)
            .background(onHover ? Color.colorTheme.MCLightGrey : Color.colorTheme.MCDarkGrey)
        }.onTapGesture {
            temporaryField = distinctField
            
            temporaryField.append(name)
            
            distinctField.appendDistinct(contentsOf: temporaryField) { distinct1, distinct2 in
                return distinct1 != distinct2
            }
        }
        .onHover { hover in
            self.onHover = hover
        }
    }
}

//struct SearchBarRow_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBarRow(temporaryField: <#Binding<[String]>#>, searchResult: <#Binding<[String]>#>, distinctField: <#Binding<[String]>#>, name: <#String#>)
//    }
//}

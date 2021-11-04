//
//  DatePickerList.swift
//  Natics
//
//  Created by Jackie Leonardy on 03/11/21.
//

import SwiftUI

struct DatePickerList: View {
    var rowTitle: String
    var rowSubTitle: String
    
    var body: some View {
            VStack {
                HStack(spacing: 8) {
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 16, height: 16, alignment: .leading)
                    VStack(alignment: .leading) {
                        Text(rowTitle)
                            .font(.system(size: 10))
                        Text(rowSubTitle)
                            .font(.system(size: 10))
                    }
                }
            }
        
    }
}

struct DatePickerList_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerList(rowTitle: "Custom...", rowSubTitle: "Use the calendar to pick a date")
    }
}

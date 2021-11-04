//
//  DatePickerCustomView.swift
//  Natics
//
//  Created by Jackie Leonardy on 04/11/21.
//

import SwiftUI

struct DatePickerCustomView: View {
    var body: some View {
        Menu {
//            DatePickerView(startDate: .constant(Date()), endDate: .constant(Date()))
        } label: {
            HStack {
                Text("Custom Range...")
                Image(systemName: "calendar")
            }.frame(width: 36, height: 165, alignment: .leading)
        }
    }
}

struct DatePickerCustomView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerCustomView()
    }
}

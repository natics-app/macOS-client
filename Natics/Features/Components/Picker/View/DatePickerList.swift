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
    @State var hovering: Bool = false
    @State var hoverColor: Color = Color.clear
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "calendar")
                .resizable()
                .frame(width: 16, height: 16, alignment: .leading)
            VStack(alignment: .leading) {
                Text(rowTitle)
                    .font(.system(size: 10))
                Text(rowSubTitle)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .font(Font.custom("SF Pro display", size: 10))
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .onHover { hovering in
            self.hovering = hovering
        }
        .padding(4)
        .background(hovering ? Color.gray.opacity(0.4) : Color.clear)
        .cornerRadius(4)
    }
}

struct DatePickerList_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerList(rowTitle: "Custom...", rowSubTitle: "Use the calendar to pick a date")
    }
}

//
//  DatePickerPopOverView.swift
//  Natics
//
//  Created by Jackie Leonardy on 04/11/21.
//

import SwiftUI

struct DatePickerPopOverView: View {
    @StateObject var viewModel: DatePickerViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack(alignment: .leading, spacing: 4) {
                    Text("Show data for")
                        .font(.system(size: 10))
                        .fontWeight(.medium)
                VStack(alignment: .leading, spacing: 0){
                    ForEach(viewModel.datePickerList, id: \.self) { data in
                        Button {
                            print(data.getCalculatedYear())
                        } label: {
                            DatePickerList(rowTitle: data.rawValue, rowSubTitle: data.getCalculatedYear())
                        }
                        .buttonStyle(PlainButtonStyle())
                    }.listRowInsets(EdgeInsets())
                }
            }
            VStack(spacing: 4) {
                Divider()
                Button {
                    viewModel.customTapped()
                } label: {
                    DatePickerList(rowTitle: "Custom...", rowSubTitle: "Use the calendar to pick a date")
                }.buttonStyle(PlainButtonStyle())
            }
        }
        .padding([.top, .leading, .trailing], 16)
        .padding(.bottom, 8)
        .frame(width: 197, height: 244, alignment: .leading)
    }
}

struct DatePickerPopOverView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerPopOverView(viewModel: DatePickerViewModel())
    }
}

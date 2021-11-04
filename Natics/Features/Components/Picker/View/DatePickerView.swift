//
//  DatePicker.swift
//  Natics
//
//  Created by Jackie Leonardy on 03/11/21.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var startDate: Date
    @Binding var endDate: Date
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text("Show data for")
            
            HStack(spacing: 8) {
                VStack(alignment: .trailing, spacing: 8) {
                    Text("Start date: ")
                    Text("End date: ")
                    
                }
                VStack (alignment: .trailing, spacing: 8){
                    DatePicker(selection: $startDate, in: ...Date(), displayedComponents: .date) {
                    }
                    .accentColor(.green)
//                            .background(RoundedRectangle(cornerRadius: 0)
//                            .fill(Color.green)
//                            .opacity(0.2))
                            .datePickerStyle(StepperFieldDatePickerStyle())
                    DatePicker(selection: $startDate, in: ...Date(), displayedComponents: .date) {
                    }
                    .datePickerStyle(StepperFieldDatePickerStyle())
                }
            }
        }.padding(16)
            .frame(width: 162, height: 101, alignment: .center)
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(startDate: .constant(Date()), endDate: .constant(Date()))
    }
}

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
    @EnvironmentObject var datePickerViewModel: DatePickerViewModel
    @ObservedObject var sideBarViewModel : SideBarViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            
            VStack() {
                
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
                                    .datePickerStyle(StepperFieldDatePickerStyle())
                            DatePicker(selection: $endDate, in: ...Date(), displayedComponents: .date) {
                             
                                
                            }
                            .datePickerStyle(StepperFieldDatePickerStyle())
                        }
                    }
                }
                HStack(spacing: 8) {
                    Button {
                        sideBarViewModel.closePopOver()
                    } label: {
                        Text("Cancel")
                            .font(Font.custom("SF Pro Text", size: 11))
                            .fontWeight(.medium)
                            .frame(width: 61, height: 16, alignment: .center)
                    }.buttonStyle(BorderlessButtonStyle())
                    
                    Button {
                        datePickerViewModel.customTapped()
                        datePickerViewModel.setCustomDate(startDate: startDate, endDate: endDate)
                        sideBarViewModel.closePopOver()
                    } label: {
                        Text("Done")
                            .font(Font.custom("SF Pro Text", size: 11))
                            .fontWeight(.medium)
                            .frame(width: 61, height: 16, alignment: .center)
                    }
                }
            }
            .frame(width: 162, height: 124, alignment: .center)
            .padding(.all, 16)


        }.cornerRadius(8)
            
            
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(startDate: .constant(Date()), endDate: .constant(Date()), sideBarViewModel: SideBarViewModel()).environmentObject(DatePickerViewModel())
    }
}

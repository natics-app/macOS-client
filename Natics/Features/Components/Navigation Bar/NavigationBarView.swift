//
//  NavigationBarView.swift
//  Natics
//
//  Created by Jackie Leonardy on 02/11/21.
//

import SwiftUI

struct NavigationBarView: View {
    @StateObject var viewModel = DatePickerViewModel()
    @State var value = ""
    var dropDownList = ["PSO", "PFA", "AIR", "HOT"]
        var body: some View {
            HStack {
                Picker(viewModel.selection!.rawValue, selection: $viewModel.selection) {
                    ForEach(viewModel.datePickerList, id: \.hashValue) { data in
                        VStack {
                            data.getContainingView()
                        }
                    }
                }.pickerStyle(MenuPickerStyle())
                    .frame(width: 240, height: 28, alignment: .center)
                
                Menu {
                        ForEach(viewModel.datePickerList, id: \.self){ client in
                            Button(client.rawValue) {
                                self.value = client.getCalculatedYear()
                            }
                        }
                } label: {
                    VStack(spacing: 5){
                        HStack{
                            Text(value.isEmpty ? viewModel.selection!.rawValue : value)
                                .foregroundColor(value.isEmpty ? .gray : .black)
                        }
                        .padding(.horizontal)
                    }
                }

            }
        }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}

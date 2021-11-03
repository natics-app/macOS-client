//
//  NavigationBarView.swift
//  Natics
//
//  Created by Jackie Leonardy on 02/11/21.
//

import SwiftUI

struct NavigationBarView: View {
    @State private var selection = "Past week"
    let timeRange = ["Past week", "Past month", "Past 3 months", "Past 6 months", "Past Year"]

        var body: some View {
            HStack {
                Picker("", selection: $selection) {
                    ForEach(timeRange, id: \.self) { data in
                        Text(data)
                        if data == timeRange.first {
                            Divider()
                        }
                    }
                }.pickerStyle(MenuPickerStyle())
                    .frame(width: 240, height: 28, alignment: .center)
            }
        }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}

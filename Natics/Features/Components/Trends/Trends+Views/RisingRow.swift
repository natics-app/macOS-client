//
//  RisingRow.swift
//  Natics
//
//  Created by Christian Adiputra on 06/11/21.
//

import SwiftUI

struct RisingRow: View {
    var risingCaseModel: RisingCategoriesModel
    var rowID: Int
    
        var body: some View {
            HStack(spacing: 24) {
                Text("\(rowID)")
                    .foregroundColor(Color.colorTheme.MCLightGrey)
                    .fontWeight(.medium)
                    .frame(width: 24, alignment: .leading)
                Text("\(risingCaseModel.name)")
                    .foregroundColor(Color.colorTheme.MCLightGrey)
                    .fontWeight(.medium)
                    .frame(width: 216, alignment: .leading)
                Text("\(risingCaseModel.total)")
                    .foregroundColor(Color.colorTheme.MCLightGrey)
                    .fontWeight(.medium)
                    .frame(width: 81, alignment: .leading)
                Text("\(risingCaseModel.recent)")
                    .foregroundColor(Color.colorTheme.MCLightGrey)
                    .fontWeight(.medium)
                    .frame(width: 75, alignment: .leading)
                HStack(spacing: 3) {
                    Text("\(String(format: "%.0f", round(risingCaseModel.percentage)))%")
                    
                    
                    Image(systemName: "arrowtriangle.up.fill")
                        .resizable()
                        .frame(width: 12, height: 6)
                }
                .foregroundColor(Color.red)
                .frame(width: 70, alignment: .leading)
                .foregroundColor(.red)
            }
        }
}

struct RisingRow_Previews: PreviewProvider {
    static var previews: some View {
        RisingRow(risingCaseModel: RisingCategoriesModel(id: 2, name: "Kukang", old: 30, recent: 15, total: 45, percentage: 50.0), rowID: 1)
    }
}

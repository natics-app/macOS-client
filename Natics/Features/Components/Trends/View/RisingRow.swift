//
//  RisingRow.swift
//  Natics
//
//  Created by Christian Adiputra on 06/11/21.
//

import SwiftUI

struct RisingRow: View {
        var body: some View {
            HStack(spacing: 24) {
                Text("1")
                    .foregroundColor(Color.colorTheme.MCBlack)
                    .fontWeight(.medium)
                    .frame(width: 24, alignment: .leading)
                Text("Kukang")
                    .foregroundColor(Color.colorTheme.MCBlack)
                    .fontWeight(.medium)
                    .frame(width: 216, alignment: .leading)
                Text("150")
                    .foregroundColor(Color.colorTheme.MCBlack)
                    .fontWeight(.medium)
                    .frame(width: 81, alignment: .leading)
                Text("20")
                    .foregroundColor(Color.colorTheme.MCBlack)
                    .fontWeight(.medium)
                    .frame(width: 75, alignment: .leading)
                HStack(spacing: 3) {
                    Text("20%")
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
        RisingRow()
    }
}

//
//  MapLegendIndicator.swift
//  MacOSMap
//
//  Created by Jackie Leonardy on 03/11/21.
//

import SwiftUI

struct MapLegendIndicator: View {
    let legendColor: Color
    let legendLabel: String
    
    var body: some View {
        HStack(spacing: 8) {
            Circle()
                .fill(legendColor)
                .frame(width: 12, height: 12)
            
            Text(legendLabel)
                .font(.system(size: 13))
        }
    }
}

struct MapLegendIndicator_Previews: PreviewProvider {
    static var previews: some View {
        MapLegendIndicator(legendColor: Color.red, legendLabel: "Sangat Rawan (>300)")
    }
}

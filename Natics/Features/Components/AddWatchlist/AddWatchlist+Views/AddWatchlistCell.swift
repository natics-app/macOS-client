//
//  AddWatchlistCell.swift
//  Natics
//
//  Created by Puras Handharmahua on 12/11/21.
//

import SwiftUI

struct AddWatchlistCell: View {
    // MARK: INJECTED PROPERTIES
    var animalName: String
    var casesNumber: Int
    
    // MARK: VIEWS PROPERTIES
    var body: some View {
        ZStack { // START: ZTACK
            HStack { // START: HTACK
                
                // Label container
                VStack(alignment: .leading, spacing: 10) { // START: VTACK
                    // Animal name label
                    Text(animalName)
                        .font(Font.system(size: 13))
                        .fontWeight(.semibold)
                    // Cases number label
                    Text("\(casesNumber) Cases")
                        .font(.system(size: 13))
                        .foregroundColor(Color.colorTheme.MCLightGreen)
                } // START: ZTACK
                
                Spacer()
                
                // Add button
                Button {
                    print("add button")
                } label: {
                    Text("Add")
                        .padding(.vertical, 5)
                        .padding(.horizontal, 25)
                        .background(Color.colorTheme.MCDarkGreen)
                        .cornerRadius(8)
                }
                .buttonStyle(.plain)
            } // START: HTACK
        } // END: ZTACK
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .background(Color.colorTheme.MCWindowBG)
    }
}

// MARK: - PREVIEW

struct AddWatchlistCell_Previews: PreviewProvider {
    static var previews: some View {
        AddWatchlistCell(animalName: "Animal Name", casesNumber: 0)
    }
}

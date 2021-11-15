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
                VStack(alignment: .leading, spacing: 10) { // START: VSTACK
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
        .background(Color.colorTheme.MCWindowBG.cornerRadius(8))
        .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.colorTheme.MCDarkGrey, lineWidth: 1))
        .padding(.horizontal,1)
        
    }
}

// MARK: - PREVIEW

struct AddWatchlistCell_Previews: PreviewProvider {
    static var previews: some View {
        AddWatchlistCell(animalName: "Animal Name", casesNumber: 0)
    }
}

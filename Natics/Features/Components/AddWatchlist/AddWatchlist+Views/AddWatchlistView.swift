//
//  AddWatchlistView.swift
//  Natics
//
//  Created by Puras Handharmahua on 12/11/21.
//

import SwiftUI

struct AddWatchlistView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        print("Close Button")
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .buttonStyle(.plain)
                    .padding(10)
                    Spacer()
                    Text("Add Watchlist")
                    Spacer()
                }
                
                
            }
        }
    }
}

struct AddWatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        AddWatchlistView()
    }
}

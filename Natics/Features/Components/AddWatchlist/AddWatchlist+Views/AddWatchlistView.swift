//
//  AddWatchlistView.swift
//  Natics
//
//  Created by Puras Handharmahua on 12/11/21.
//

import SwiftUI

struct AddWatchlistView: View {
    
    // MARK: PUBLISHED PROPERTIES
    @StateObject private var addWatchlistVM = AddWatchlistViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: PRIVATE PROPERTIES
    private var title = "Add Watchlist"
    
    // MARK: VIEWS
    var body: some View {
        ZStack { // START: ZSTACK
            Color.colorTheme.MCWindowBG
            
            VStack { // START: VSTACK-1
                VStack { // START: VSTACK-2
                    HStack { // START: HSTACK
                        
                        // Close Button
                        Button {
                            presentationMode.wrappedValue.dismiss()
                            print("Close Button")
                        } label: {
                            Image(systemName: "xmark")
                                .font(Font.system(size: 20))
                        }
                        .buttonStyle(.plain)
                        
                        Spacer()
                        
                        // Title
                        Text(title)
                            .font(Font.system(size: 24))
                            .fontWeight(.semibold)
                        
                        Spacer()
                    } // END: HSTACK
                } // END: VSTACK-2
                .padding(24)
                
                // Content Container
                VStack { // START: VSTACK-3
                    
                    // Search Bar
                    MCSearchBar(text: $addWatchlistVM.searchText)
                    
                    // Subtitle
                    HStack { // START: HSTACK
                        Text(addWatchlistVM.titleString)
                            .font(Font.system(size: 17))
                            .fontWeight(.semibold)
                        Spacer()
                    } // END: HSTACK
                    .padding(.vertical, 24)
                    
                    // List
                    GeometryReader { geo in // START: GEO
                        ScrollView(.vertical) {
                            VStack { // START: VSTACK-4
                                List {
                                    ForEach(
                                        addWatchlistVM.getAnimalTrendings,
                                        id: \.id
                                    ) { item in
                                        AddWatchlistCell(
                                            animalName: item.name.capitalizingFirstLetter(),
                                            casesNumber: item.newsCount ?? 0)
                                    }
                                }
                            } // END: VSTACK-4
                            .frame(height: geo.frame(in: .local).size.height)
                        }
                    } // END: GEO
                    .frame(maxHeight: .infinity)
                    .padding(-15)
                } // END: VSTACK-3
                .padding(.horizontal, 50)
            } // END: VSTACK-1
        } // END: ZSTACK
    }
}

struct AddWatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        AddWatchlistView()
    }
}

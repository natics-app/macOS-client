//
//  IconButton.swift
//  Natics
//
//  Created by Jackie Leonardy on 02/11/21.
//

import SwiftUI

struct ActionButton: View {
    
    let action: () -> ()
    let imageName: String
    
    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 21.0, height: 24.0)
        }.background(Color.clear)
        .buttonStyle(PlainButtonStyle())

    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(action: {
            
        }, imageName: "bell.badge.fill")
    }
}

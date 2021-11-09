//
//  HighlightCard.swift
//  AnimalGraph
//
//  Created by Peter Lee on 05/11/21.
//

import SwiftUI

struct HighlightCard: View {
    var body: some View {
        ZStack{
            VStack{
                Text("Name")
                    .font(.system(size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                    .padding(.top, 18)
                    .padding(.leading, 16)
                HStack{
                    Text("6666")
                        .font(.system(size: 56))
                        .padding(.leading, 16)
                        .padding(.bottom, 16)
                        .padding(.top, 10)
                    Spacer()
                    Group{
                        Image(systemName: "triangle.fill")
                            .offset(x: 20)
                            .foregroundColor(.red)
                        Text("66")
                            .font(.system(size: 24))
                            .foregroundColor(.red)
                        
                    }
                    .padding(.trailing, 16)
                }
            }
        }
        .frame(width: 297, height: 150)
    }
}

struct HighlightCard_Previews: PreviewProvider {
    static var previews: some View {
        HighlightCard()
            
    }
}

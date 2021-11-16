//
//  HighlightCard.swift
//  AnimalGraph
//
//  Created by Peter Lee on 05/11/21.
//

import SwiftUI

struct HighlightCard: View {
    let name: String?
    @ObservedObject var content: HighlightCardContent
    
    var body: some View {
        VStack{
            Text("\(name ?? "")")
                .font(.system(size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)
                .padding(.top, 18)
                .padding(.leading, 16)
            HStack{
                Text("\(content.value ?? 6666)")
                    .font(.system(size: 56))
                    .padding(.leading, 16)
                    .padding(.bottom, 16)
                    .padding(.top, 10)
                
                Spacer()
                if let arrow = content.arrow,
                   let color = content.color,
                   let changes = content.changes {
                    Group{
                        Image(systemName: arrow)
                            .offset(x: 20)
                            .foregroundColor(color)
                        Text("\(changes)")
                            .font(.system(size: 24))
                            .foregroundColor(color)
                        
                    }
                    .padding(.trailing, 16)
                }
            }
            
        }
    }
}

class HighlightCardContent: ObservableObject {
    @Published var value: Int? = nil
    @Published var changes: Int? = nil
    @Published var arrow: String? = nil
    @Published var color: Color? = nil
}

struct HighlightCard_Previews: PreviewProvider {
    static var previews: some View {
        HighlightCard(name: "Total Cases", content: HighlightCardContent())
    }
}

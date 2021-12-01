//
//  NoticationRow.swift
//  Natics
//
//  Created by Jackie Leonardy on 30/11/21.
//

import SwiftUI

struct NotificationRow: View {
    var animalTitle: String
    var notificationLabel: String
    var notificationDate: String
    @State var hovering: Bool = false
    @State var hoverColor: Color = Color.clear
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Color.accentColor
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .padding(.all, 10)
            }
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 4) {
                    Text(animalTitle)
                        .font(.system(size: 10))
                        .fontWeight(.bold)
                    Text(notificationLabel)
                        .font(.system(size: 10))
                }
                Text(notificationDate)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .font(Font.custom("SF Pro display", size: 10))
                    .foregroundColor(.green)
            }
            Spacer()
        }
        .onHover { hovering in
            self.hovering = hovering
        }
        .padding(16)
        .background(hovering ? Color.gray.opacity(0.4) : Color.gray)
        .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.colorTheme.MCDarkGrey, lineWidth: 1))
    }
}

struct NoticationRow_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRow(animalTitle: "Kukang", notificationLabel: "is now Trending", notificationDate: "Now")
    }
}

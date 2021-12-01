//
//  NotificationPopOverView.swift
//  Natics
//
//  Created by Jackie Leonardy on 30/11/21.
//

import SwiftUI

struct NotificationPopOverView: View {
    @ObservedObject var viewModel: DatePickerViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "hands.clap.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                Spacer()
                Text("Notification")
                    .font(Font.system(size: 18))
            }.padding(24)
            
            HStack(spacing: 16) {
                Button {
                    
                } label: {
                    VStack {
                        Text("Unread")
                            .foregroundColor(.primary)
                            .padding(.vertical)
                            .padding(.horizontal, 4)
                            .border(width: 2, edges: [.bottom], color: Color.accentColor)
                    }
                }
                .buttonStyle(LinkButtonStyle())
                .background(Color.blue)
                
                Button {
                    
                } label: {
                    HStack(spacing: 4) {
                        Text("All")
                            .foregroundColor(.primary)
                            .padding(.vertical)
                            .padding(.leading, 4)
                            
                        Text("26")
                            .foregroundColor(.white)
                            .padding(.horizontal, 5)
                            .background(Color.red)
                            .padding(.trailing, 4)
                            .cornerRadius(4)
                        
                    }.border(width: 2, edges: [.bottom], color: Color.accentColor)
                        .background(Color.blue)
                }
                .buttonStyle(LinkButtonStyle())
                
                Button {
                    
                } label: {
                    VStack {
                        Text("Watchlist")
                            .foregroundColor(.primary)
                            .padding(.vertical)
                            .padding(.horizontal, 4)
                            .border(width: 2, edges: [.bottom], color: Color.accentColor)
                            .background(Color.blue)
                    }
                }
                .buttonStyle(LinkButtonStyle())
                
                Spacer()
            }.padding(.horizontal)
            Divider()
            
            VStack(alignment: .leading, spacing: 8){
                ForEach(viewModel.datePickerList, id: \.self) { data in
                    Button {
                        
                    } label: {
                        NotificationRow(animalTitle: "Kukang", notificationLabel: "is now Trending", notificationDate: "Now")
                    }
                    .buttonStyle(PlainButtonStyle())
                    .background(Color.orange)
                    
                    Button {
                        
                    } label: {
                        NotificationRow(animalTitle: "Kukang", notificationLabel: "is now Trending", notificationDate: "Now")
                    }
                    .buttonStyle(PlainButtonStyle())
                    .background(Color.orange)
                }.listRowInsets(EdgeInsets())
            }.padding(16)
            
            Spacer()
        }
        .frame(width: 320, height: 900)
    }
}

struct NotificationPopOverView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPopOverView(viewModel: DatePickerViewModel())
    }
}

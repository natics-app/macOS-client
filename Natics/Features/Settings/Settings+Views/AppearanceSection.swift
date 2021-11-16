//
//  AppearanceSection.swift
//  SettingsPage
//
//  Created by Peter Lee on 09/11/21.
//

import SwiftUI

struct AppearanceSection: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Appearance")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(width: 1260, alignment: .leading)
                    .padding(.top, 24)
                    .padding(.leading, 24)
                
                Divider()
                    .padding([.leading, .trailing], 16)
                
                HStack {
                    Image(systemName: "sun.max")
                        .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                        .offset(x: 10)
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20, alignment: .leading)
                        .offset(x:-20)
                        .padding(.leading, 46)
                        .padding(.trailing, 24)
                    
                    VStack{
                        Text("Change appearance")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .frame(width: 600, alignment: .leading)
                            .padding(.bottom, 2)
                            
                        
                        Text("Set the interface appearance based on your preference")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                            .frame(width: 600, alignment: .leading)
                    }
                    

                    

                    Spacer()
                    Menu(/*@START_MENU_TOKEN@*/"Menu"/*@END_MENU_TOKEN@*/) {
                        Text("Menu 1")
                        
                    }
                        .frame(width: 104, height: 20, alignment: .trailing)
                        .padding(.trailing, 54)
                        .padding([.top, .bottom], 38)
                    
                }
                
                Divider()
                    .padding([.leading, .trailing], 24)
            }
        }
    }
}

struct AppearanceSection_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceSection()
    }
}

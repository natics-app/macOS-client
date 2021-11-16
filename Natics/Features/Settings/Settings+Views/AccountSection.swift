//
//  AccountSection.swift
//  SettingsPage
//
//  Created by Peter Lee on 09/11/21.
//

import SwiftUI

struct AccountSection: View {
    var body: some View {
        ZStack{
            VStack{
                Text("Account")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(width: 1260, alignment: .leading)
                    .padding(.top, 24)
                    .padding(.leading, 24)
                
                Divider()
                    .padding([.leading, .trailing], 16)
                
                HStack{
                    Image(systemName: "envelope")
                        .resizable()
                            .scaledToFill()
                            .frame(width: 20.0, height: 20.0)
                        .offset(x: 20)
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20, alignment: .leading)
                        .offset(x:-20)
                        .padding(.leading, 46)
                        .padding(.trailing, 24)
                    
                    VStack{
                        Text("Email")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .frame(width: 380, alignment: .leading)
                            .padding(.bottom, 2)
                            
                        
                        Text("current@emailcom")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                            .frame(width: 380, alignment: .leading)
                    }
                    

                    

                    Spacer()

                    Button(action: {
                           //do action
                    }) {
                        Text("Edit...")
                            .font(.system(size: 13))
                            .fontWeight(.medium)
                    }
                    .frame(minWidth: 127, minHeight: 28)
                    .buttonStyle(PlainButtonStyle())
                    .background(Color.gray)
                    .cornerRadius(6)
                    .padding(.trailing, 54)
                    .padding([.top, .bottom], 36)

                }
                
                Divider()
                    .padding([.leading, .trailing], 24)
                
                HStack{
                    Image(systemName: "lock")
                        .resizable()
                            .scaledToFill()
                            .frame(width: 20.0, height: 20.0)
                        .offset(x: 20)
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20, alignment: .leading)
                        .offset(x:-20)
                        .padding(.leading, 46)
                        .padding(.trailing, 24)
                    
                    VStack{
                        Text("Password")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .frame(width: 380, alignment: .leading)
                            .padding(.bottom, 2)
                        
                        Text("*******")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                            .frame(width: 380, alignment: .leading)
                    }
                    

                    Spacer()

                    Button(action: {
                           //do action
                    }) {
                        Text("Edit...")
                            .font(.system(size: 13))
                            .fontWeight(.medium)
                    }
                    .frame(minWidth: 127, minHeight: 28)
                    .buttonStyle(PlainButtonStyle())
                    .background(Color.gray)
                    .cornerRadius(6)
                    .padding(.trailing, 54)
                    .padding([.top, .bottom], 36)
                    
                    
                }
                Divider()
                    .padding([.leading, .trailing], 24)
            }
        }
        .frame(width: 1284)
    }
}

struct AccountSection_Previews: PreviewProvider {
    static var previews: some View {
        AccountSection()
    }
}

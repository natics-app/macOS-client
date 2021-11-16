//
//  CasesTableRow.swift
//  Natics
//
//  Created by Christian Adiputra on 09/11/21.
//

import SwiftUI

struct CasesTableRow: View {
    
    var rowcase: NewsModel
    var rowindex: Int = 1
    
    var body: some View {
        HStack (spacing: 0) {
            HStack(spacing: 16) {
                Text("\(rowindex)")
                    .fontWeight(.medium)
                    .frame(width: 42, alignment: .leading)
                Text(rowcase.title)
                    .fontWeight(.medium)
                    .frame(width: 204, alignment: .leading)
                    .lineLimit(0)
                Text(rowcase.news_date)
                    .fontWeight(.medium)
                    .frame(width: 88, alignment: .leading)
                HStack {
                    ForEach(rowcase.animals, id: \.id) { animal in
                        Text("\(animal.name)")
                            .fontWeight(.medium)
                    }
                }
                .lineLimit(0)
                .frame(width: 190, alignment: .leading)
                HStack {
                    ForEach(rowcase.regencies ?? [], id: \.id) { regency in
        
                            Text(String("\(regency.province.name) \n" ?? "-"))
                                .fontWeight(.medium)   
                    }
                }
                .lineLimit(0)
                .frame(width: 97, alignment: .leading)
                HStack {
                    ForEach(rowcase.regencies ?? [], id: \.id) { regency in
                        if regency.name != nil {
                            Text(String("\(regency.name) \n"))
                                .fontWeight(.medium)
                        } else {
                            Text("-")
                                .fontWeight(.medium)
                        }
                        
                            
                    }
                }
                .frame(width: 97, alignment: .leading)
                .lineLimit(0)
            }
            .foregroundColor(Color.colorTheme.MCBlack)
            HStack(spacing: 16) {
                HStack {
                    ForEach(rowcase.organizations, id: \.id) { org in

                        Text(String(org.name ?? "-"))
                                .fontWeight(.medium)
                                .lineLimit(0)
                                

                    }
                }.frame(width: 97, alignment: .leading)
                
                //Text(rowcase.organizations.joined(separator: ","))
                Text(rowcase.date ?? "")
                    .fontWeight(.medium)
                    .frame(width: 85, alignment: .leading)
                    .lineLimit(0)
                Text(rowcase.label)
                    .fontWeight(.medium)
                    .frame(width: 116, alignment: .leading)
                    .lineLimit(0)
                Text(rowcase.site?.name ?? "N/A")
                    .fontWeight(.medium)
                    .frame(width: 85, alignment: .leading)
                    .lineLimit(0)
                Text(rowcase.url)
                    .fontWeight(.medium)
                    .frame(width: 115, alignment: .leading)
                    .lineLimit(0)
            }
            .foregroundColor(Color.colorTheme.MCBlack)
            HStack{
                Button(action: {}){
                    Text("Edit")
                        .fontWeight(.medium)
                }
                    .frame(width: 74, height: 20)
                    .buttonStyle(.plain)
                    .background(Color.colorTheme.MCDarkGreen)
                    .cornerRadius(4)
                    .padding(.leading, 32)
                Button(action: {}){
                    Text("Remove")
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                }
                    .frame(width: 74, height: 20)
                    .buttonStyle(.plain)
                    .background(Color.gray)
                    .cornerRadius(4)
                    .padding(.leading, 16)
            }
            
        }
        .padding(.leading, 16)
    }
}

struct CasesTableRow_Previews: PreviewProvider {
    static var previews: some View {
        CasesTableRow(rowcase: NewsModel(id: 1, title: "apa aja", url: "asdada", date: "21313", news_date: "adsada", is_trained: 1, label: "penyitaan", organizations: [], site: SiteModel(id: 1, name: "x"), animals: [], regencies: []), rowindex: 1 )
    }
}

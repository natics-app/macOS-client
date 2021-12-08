//
//  CaseEditPopUpView.swift
//  Natics
//
//  Created by Jackie Leonardy on 07/11/21.
//

import SwiftUI

struct CaseEditPopUpView: View {
    @Binding var caseDate: Date
    @State private var animalName: String = ""
    @State private var organizationName: String = ""
    @State private var selectedRegency = "Jawa Barat"
    @State private var notes = "Yoana Vebrie, General Manager Pet Kingdom, menuturkan bahwa kegiatan ini diadakan secara rutin untuk terus mengajak para pemilik hewan peliharaan dan pencinta hewan menyalurkan kepedulian kepada kesejahteraan anjing dan kucing yang ada di rumah penampungan hewan. Yoana Vebrie, General Manager Pet Kingdom, menuturkan bahwa kegiatan ini diadakan secara rutin untuk terus mengajak para pemilik hewan peliharaan dan pencinta hewan menyalurkan kepedulian kepada kesejahteraan anjing dan kucing yang ada di rumah penampungan hewan. Yoana Vebrie, General Manager Pet Kingdom, menuturkan bahwa kegiatan ini diadakan secara rutin untuk terus mengajak para pemilik hewan peliharaan dan pencinta hewan menyalurkan kepedulian kepada kesejahteraan anjing dan kucing yang ada di rumah penampungan hewan. rumah penampungan hewan. Yoana Vebrie, General Manager Pet Kingdom, menuturkan bahwa kegiatan ini diadakan secara rutin untuk terus mengajak para pemilik hewan peliharaan dan pencinta hewan menyalurkan kepedulian kepada kesejahteraan anjing dan kucing yang ada di rumah penampungan hewan."
    
    @Binding var show: Bool
    
    @State private var searchText = ""
    @State private var temporaryField = [String]()
    @State private var distinctField = [String]()
    @State private var beginEditing = false
    
    let names = ["Holly", "Josh", "Rhonda", "Ted", "Holly2", "This is Holly", "Josh2 aasdasdasd asdas dsa"]
    
    var searchResults: [String] {
        if !searchText.isEmpty {
            return names.filter { $0.localizedCaseInsensitiveContains(searchText) }
        } else {
            return names[randomPick: 4]
        }
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    ZStack(alignment: .leading) {
                        Button {
                            withAnimation {
                                show.toggle()
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .leading)
                        }.buttonStyle(PlainButtonStyle())
                        
                        HStack(alignment: .bottom) {
                            Spacer()
                            Text("Edit Cases")
                            .font(Font.custom("SF Pro Text", size: 24))
                            .fontWeight(.semibold)
                            Spacer()
                        }
                    }
                    
                    ScrollView(.vertical) {
                        VStack(alignment: .leading, spacing: 16) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("News Title")
                                    .font(.headline)
                                Text("Kukang Mengsedih")
                                    .font(Font.custom("SF Pro Text", size: 13))
                            }
                            
                            HStack(spacing: 80){
                                GeometryReader { geometry in
                                    HStack(spacing: 0) {
                                        VStack(alignment: .leading, spacing: 8) {
                                            Text("News Dates")
                                                .font(.headline)
                                            Text("2021/10/20")
                                                .font(Font.custom("SF Pro Text", size: 13))
                                        }.frame(width: geometry.size.width * 0.50, alignment: .leading)
                                        
                                        VStack(alignment: .leading, spacing: 8) {
                                            Text("Case Date")
                                                .font(.headline)
                                            DatePicker(selection: $caseDate, in: ...Date(), displayedComponents: .date) { }
                                                .accentColor(.green)
                                                .datePickerStyle(StepperFieldDatePickerStyle())
                                        }.frame(width: geometry.size.width * 0.50, alignment: .leading)
                                    }
                                }.frame(height: 40, alignment: .leading)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Animal Name")
                                    .font(.headline)
                                HStack {
                                    WrappingHStack(distinctField.indices, id:\.self) { index in
                                            LabelButton(title: distinctField[index], action: {
                                                    distinctField.remove(at: index)
                                            }, color: Color.colorTheme.MCDarkGreen)
                                            .padding([.vertical], 4)
                                            .padding([.horizontal], 2)
                                       }
                                    .padding(4)
                                }.frame(maxWidth: .infinity, minHeight: 40)
                                .background(Color.colorTheme.MCDarkGrey)
                                .cornerRadius(4)
                                .gesture(
                                    TapGesture()
                                        .onEnded { _ in
                                            withAnimation {
                                                beginEditing.toggle()
                                            }
                                    }
                                )
                                ZStack {
                                    if beginEditing {
                                        VStack(spacing: 0) {
                                            SearchBar(text: $searchText)
                                                .animation(.easeInOut(duration: 3))
                                            
                                            HStack {
                                                WrappingHStack(searchResults.indices, id:\.self) { index in
                                                    SearchBarRowLabel(temporaryField: $temporaryField, distinctField: $distinctField, name: searchResults[index])
                                                }
                                                .padding(10)
                                            }
                                            .frame(maxWidth: .infinity)
                                            .background(Color.colorTheme.MCBlack)
                                        }

                                    }
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Organization")
                                    .font(.headline)
                                HStack {
                                    WrappingHStack(distinctField.indices, id:\.self) { index in
                                            LabelButton(title: distinctField[index], action: {
                                                    distinctField.remove(at: index)
                                            }, color: Color.colorTheme.MCDarkGreen)
                                            .padding([.vertical], 4)
                                            .padding([.horizontal], 2)
                                       }
                                    .padding(4)
                                }.frame(maxWidth: .infinity, minHeight: 40)
                                .background(Color.colorTheme.MCDarkGrey)
                                .cornerRadius(4)
                                .gesture(
                                    TapGesture()
                                        .onEnded { _ in
                                            withAnimation {
                                                beginEditing.toggle()
                                            }
                                    }
                                )
                                ZStack {
                                    if beginEditing {
                                        VStack(spacing: 0) {
                                            SearchBar(text: $searchText)
                                                .animation(.easeInOut(duration: 3))
                                            
                                            HStack {
                                                WrappingHStack(searchResults.indices, id:\.self) { index in
                                                    SearchBarRowLabel(temporaryField: $temporaryField, distinctField: $distinctField, name: searchResults[index])
                                                }
                                                .padding(10)
                                            }
                                            .frame(maxWidth: .infinity)
                                            .background(Color.colorTheme.MCBlack)
                                        }

                                    }
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Regency")
                                    .font(.headline)
                                HStack {
                                    WrappingHStack(distinctField.indices, id:\.self) { index in
                                            LabelButton(title: distinctField[index], action: {
                                                    distinctField.remove(at: index)
                                            }, color: Color.colorTheme.MCDarkGreen)
                                            .padding([.vertical], 4)
                                            .padding([.horizontal], 2)
                                       }
                                    .padding(4)
                                }.frame(maxWidth: .infinity, minHeight: 40)
                                    .background(Color.colorTheme.MCDarkGrey)
                                .cornerRadius(4)
                                .gesture(
                                    TapGesture()
                                        .onEnded { _ in
                                            withAnimation {
                                                beginEditing.toggle()
                                            }
                                    }
                                )
                                ZStack {
                                    if beginEditing {
                                        VStack(spacing: 0) {
                                            SearchBar(text: $searchText)
                                                .animation(.easeInOut(duration: 3))
                                            HStack {
                                                WrappingHStack(searchResults.indices, id:\.self) { index in
                                                    SearchBarRowLabel(temporaryField: $temporaryField, distinctField: $distinctField, name: searchResults[index])
                                                }
                                                .padding(10)
                                            }
                                            .frame(maxWidth: .infinity)
                                            .background(Color.colorTheme.MCBlack)
                                        }
                                    }
                                }
                            }
                            
                            HStack(spacing: 80){
                                GeometryReader { geometry in
                                    HStack(spacing: 0) {
                                        VStack(alignment: .leading, spacing: 8) {
                                            Text("Province")
                                                .font(.headline)
                                            Text("Nusa Tenggara Timur")
                                                .font(Font.custom("SF Pro Text", size: 13))
                                        }.frame(width: geometry.size.width * 0.50, alignment: .leading)
                                        
                                        
                                        VStack(alignment: .leading, spacing: 8) {
                                            Text("Case Categories")
                                                .font(.headline)
                                            Text("Illegal Trading")
                                                .font(Font.custom("SF Pro Text", size: 13))
                                        }
                                    }
                                }
                                .frame(height: 40, alignment: .leading)
                               
                            }
                            
                            HStack(spacing: 80) {
                                GeometryReader { geometry in
                                    HStack(spacing: 0) {
                                        VStack(alignment:. leading, spacing: 8) {
                                            Text("Media Name")
                                                .font(.headline)
                                            Text("Kompas")
                                                .font(Font.custom("SF Pro Text", size: 13))
                                            
                                        }
                                        .frame(width: geometry.size.width * 0.50, alignment: .leading)
                                        
                                        VStack(alignment:. leading, spacing: 8) {
                                            Text("Media List")
                                                .font(.headline)
                                            
                                            HyperlinkText(urlLink: "https://www.kompas.com/sains/read/2021/11/08/180200723/5-burung-terbesar-di-dunia?page=all")
                                                
                                        }.frame(width: geometry.size.width * 0.50, alignment: .leading)
                                    }
                                }
                                .frame(height: 40, alignment: .leading)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Notes")
                                    .font(.headline)
                                TextEditor(text: $notes)
                                    .background(Color.white)
                                    .frame(minHeight: 40)
                                    .cornerRadius(4)
                            }
                            
                        }
                        .padding(.horizontal, 20)
                        .padding([.top], 8)
                        .frame(maxHeight: .infinity)
                    }
                    .padding([.bottom], 20)
                    
                    //MARK: End of Scroll View
                    
                    HStack(spacing: 8) {
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Delete Case")
                                .font(Font.custom("SF Pro Text", size: 11))
                                .fontWeight(.medium)
                                .frame(width: 120, height: 16, alignment: .center)
                        }.buttonStyle(BorderlessButtonStyle())
                        
                        ExportButton {
                            
                        }.frame(width: 120, height: 16, alignment: .center)
                    }.fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 20)
                }

            }
            .frame(width: 550, height: 619, alignment: .center)
            .padding(24)
            .background(Color.colorTheme.MCWindowBG)
            .animation(.easeInOut(duration: 0.2))
        }
    }
}

struct CaseEditPopUpView_Previews: PreviewProvider {
    static var previews: some View {
        CaseEditPopUpView(caseDate: .constant(Date()), show: .constant(false))
    }
}

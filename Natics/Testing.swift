//
//  Testing.swift
//  Natics
//
//  Created by Puras Handharmahua on 12/11/21.
//

import SwiftUI

struct Testing: View {
    @StateObject var vm = ContohViewModel()
    
    var body: some View {
        Text(vm.provinces.first?.name ?? "")
            .onAppear {
                vm.getAllProvinces()
            }
    }
}

struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        Testing()
    }
}

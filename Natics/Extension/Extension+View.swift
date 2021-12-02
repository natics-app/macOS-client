//
//  Extension+View.swift
//  Natics
//
//  Created by Jackie Leonardy on 30/11/21.
//

import SwiftUI

extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

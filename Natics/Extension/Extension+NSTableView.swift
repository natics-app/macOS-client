//
//  Extension+NSTableView.swift
//  Natics
//
//  Created by Christian Adiputra on 03/11/21.
//

import Foundation
import SwiftUI

extension NSTableView {
    open override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()

        backgroundColor = NSColor.clear
        enclosingScrollView!.drawsBackground = false
    }
}

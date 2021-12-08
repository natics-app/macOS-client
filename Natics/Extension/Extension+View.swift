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
    
    func renderAsImage() -> NSImage? {
        let view = NoInsetHostingView(rootView: self)
        view.setFrameSize(view.fittingSize)
        print(view.frame.size)
        return view.bitmapImage()
    }

}

public extension NSView {
    
    func bitmapImage() -> NSImage? {
        guard let rep = bitmapImageRepForCachingDisplay(in: bounds) else {
            return nil
        }
        cacheDisplay(in: bounds, to: rep)
        guard let cgImage = rep.cgImage else {
            return nil
        }
        return NSImage(cgImage: cgImage, size: bounds.size)
    }
    
}


class NoInsetHostingView<V>: NSHostingView<V> where V: View {
    
    override var safeAreaInsets: NSEdgeInsets {
        return .init()
    }
    
}

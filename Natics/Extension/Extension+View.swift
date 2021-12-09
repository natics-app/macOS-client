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
//        let contentRect = NSRect(x: 0, y: 0, width: 900, height: 900)
//        let newWindow = NSWindow(
//            contentRect: contentRect,
//            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
//            backing: .buffered, defer: false)
//        let view = NoInsetHostingView(rootView: self)
//        view.setFrameSize(view.fittingSize)
//        newWindow.contentView = view
//        newWindow.contentView?.setFrameSize(view.fittingSize)
//
//        print(view.frame.size)
//        return newWindow.contentView?.bitmapImage()
        
        let view = NoInsetHostingView(rootView: self)
        view.setFrameSize(view.fittingSize)
        print("view frame size\(view.frame.size)")
        
        let aa = NSHostingView(rootView: self)
        aa.setFrameSize(aa.fittingSize)
        
        print("view frame size\(aa.frame.size)")
        return view.bitmapImage()
        
//        let viewToCapture = view.window!.contentView!
//        let rep = viewToCapture.bitmapImageRepForCachingDisplay(in: viewToCapture.bounds)!
//        viewToCapture.cacheDisplay(in: viewToCapture.bounds, to: rep)
//
//        let img = NSImage(size: viewToCapture.bounds.size)
//        img.addRepresentation(rep)
    }
    
    func renderAsImage(origin: CGPoint, size: CGSize) -> NSImage? {
        let contentRect = NSRect(origin: origin, size: size)
        let newWindow = NSWindow(
            contentRect: contentRect,
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        let view = NoInsetHostingView(rootView: self)
        
        
        view.setFrameSize(view.fittingSize)
        newWindow.contentView = view
        newWindow.contentView?.setFrameSize(view.fittingSize)

        return newWindow.contentView?.bitmapImage()
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

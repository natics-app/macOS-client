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
        return view.bitmapImage()
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
    
    public func rasterizeBitmap(at size: CGSize) ->  NSBitmapImageRep {
        let nsView = NSHostingView(rootView: self.frame(width: size.width, height: size.height))
        nsView.frame.size = size
                
        let bitmapRep = nsView.bitmapImageRepForCachingDisplay(in: nsView.bounds)!
        bitmapRep.size = nsView.bounds.size
        nsView.cacheDisplay(in: nsView.bounds, to: bitmapRep)
        return bitmapRep
    }
    
    public func rasterize(at size: CGSize) -> NSImage {
        let image = NSImage(size: size)
        image.addRepresentation(self.rasterizeBitmap(at: size))
        return image
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

//
//  Extension+FilePanel.swift
//  Natics
//
//  Created by Jackie Leonardy on 08/12/21.
//

import Cocoa

extension NSSavePanel {
    
    static func saveImage(_ image: NSImage, completion: @escaping (_ result: Result<Bool, Error>) -> ()) {
        let savePanel = NSSavePanel()
        savePanel.canCreateDirectories = true
        savePanel.showsTagField = false
        savePanel.nameFieldStringValue = "image.png"
        savePanel.nameFieldLabel = "Chart Name:"
        savePanel.prompt = "Save"
        savePanel.title = "Saving Chart..."
        savePanel.level = NSWindow.Level(rawValue: Int(CGWindowLevelForKey(.modalPanelWindow)))
        savePanel.begin { (result) in
            guard result == .OK,
                let url = savePanel.url else {
                completion(.failure(
                    NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to get file location"])
                ))
                return
            }
            
            DispatchQueue.global(qos: .userInitiated).async {
                guard
                    let data = image.tiffRepresentation,
                    let imageRep = NSBitmapImageRep(data: data) else { return }
                
                do {
                    let imageData = imageRep.representation(using: .png, properties: [.compressionFactor: 1.0])
                    try imageData?.write(to: url)
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}

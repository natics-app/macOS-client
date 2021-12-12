//
//  DownloadShareButtonViewModel.swift
//  Natics
//
//  Created by Jackie Leonardy on 07/12/21.
//
import SwiftUI

class DownloadShareButtonViewModel: ObservableObject {


    func buildSavePanel() -> NSSavePanel {
        let savePanel = NSSavePanel()
        savePanel.title = "Saving Image"
        savePanel.nameFieldLabel = "Image Name:"
        savePanel.nameFieldStringValue = "Image.png"
        savePanel.canCreateDirectories = true
        savePanel.allowedFileTypes = ["png", "pdf"]
        savePanel.prompt = "Save Charts"
        savePanel.message = "You Are saving Charts"
        savePanel.showsTagField = true
        savePanel.allowsOtherFileTypes = false
        return savePanel
    }
    
    
    func generateFile(fileContent: Any, _ fileNames: String) -> URL {
        var fileName = fileNames.replacingOccurrences(of: "-", with: "until")
        fileName = fileName.replacingOccurrences(of: "/", with: "-")
        fileName = "NewsCase " + fileName + ".csv"
        guard let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName) else { return URL(string: "")! }
            do {
                try (fileContent as! String).write(to: path, atomically: true, encoding: .utf8)
                print("CSV File ready to share")
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        return path
    }
    
//    func openSaveDialog() {
//        let savePanel = buildSavePanel()
//        
//        savePanel.begin { [weak self] response in
//            switch response {
//                case .OK:
//                    guard let saveURL = savePanel.url else { return }
//                    if let image = exampleOutputImageView.image {
//                        image.writePNG(to: saveURL)
//                    } else {
//                        let alert = NSAlert()
//                        alert.messageText = "Error"
//                        alert.informativeText = "Failed to save image."
//                        alert.alertStyle = .informational
//                        alert.addButton(withTitle: "OK")
//                        alert.runModal()
//                    }
//                case .cancel:
//                    print("User Cancelled")
//                default:
//                    print("Panel shouldn't be anything other than OK or Cancel")
//            }
//        }
//    }
}

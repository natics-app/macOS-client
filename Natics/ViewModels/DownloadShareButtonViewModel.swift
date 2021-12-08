//
//  DownloadShareButtonViewModel.swift
//  Natics
//
//  Created by Jackie Leonardy on 07/12/21.
//

import SwiftUI

class DownloadShareButtonViewModel: ObservableObject {
    
    
//    func buildSavePanel(_ type: FileType) -> NSSavePanel {
//        let savePanel = NSSavePanel()
//        savePanel.title = type.savePanelTitle()
//        savePanel.nameFieldLabel = type.nameFieldLabel()
//        savePanel.nameFieldStringValue = type.fileName()
//        savePanel.canCreateDirectories = true
//        savePanel.allowedFileTypes = type.fileType()
//        return savePanel
//    }
    
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
}

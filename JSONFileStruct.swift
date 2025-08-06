//
//  JSONFileStruct.swift
//  DLMCSPSE01 - Thom Alting von Geusau - FridgeFriend-TEST
//
//  Created by Thom Alting von Geusau on 04/08/2025.
//

import UniformTypeIdentifiers
import SwiftUI

struct JSONFile: FileDocument {
    static var readableContentTypes: [UTType] { [.json] }
    var data: Data
    var name: String

    init(data: Data, name: String = "File") {
        self.data = data
        self.name = name
    }

    init(configuration: ReadConfiguration) throws {
        self.data = configuration.file.regularFileContents ?? Data()
        self.name = "Imported"
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper(regularFileWithContents: data)
    }
}

//
//  File.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/12.
//

import Foundation

public struct MapperGenerator: GeneratorProtocol {
    let sourceFilePath: URL
    let destinationFilePath: URL
    let outputDirectoryPath: URL

    public init(sourceFilePath: URL, destinationFilePath: URL, outputDirectoryPath: URL) {
        self.sourceFilePath = sourceFilePath
        self.destinationFilePath = destinationFilePath
        self.outputDirectoryPath = outputDirectoryPath
    }

    public func createOrder() -> String {
        let sourceContents = try? loadInputFile(sourceFilePath)
        let destinationContents = try? loadInputFile(destinationFilePath)
        let name = createFileName().replacingOccurrences(of: ".swift", with: "")
        let order = "Generate \(name) struct for them with Swift without comment.\n\n"
        return order + "\(sourceContents ?? "")\n\n\(destinationContents ?? "")"
    }
    
    public func createOutputPath() -> URL {
        outputDirectoryPath.appending(component: createFileName())
    }
    
    func createFileName() -> String {
        destinationFilePath.lastPathComponent.replacingOccurrences(of: ".swift", with: "Mapper.swift")
    }
}

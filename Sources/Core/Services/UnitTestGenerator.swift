//
//  UnitTestGenerator.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/11.
//

import Foundation

public struct UnitTestGenerator: GeneratorProtocol {
    let inputFilePath: URL
    let outputDirectoryPath: URL
    
    public init(inputFilePath: URL, outputDirectoryPath: URL) {
        self.inputFilePath = inputFilePath
        self.outputDirectoryPath = outputDirectoryPath
    }
    
    public func createOrder() -> String {
        let fileContents = try? loadInputFile(inputFilePath)
        let order = "Generate unit test for this codes with Swift without comment.\n\n"
        return order + (fileContents ?? "")
    }

    public func createOutputPath() -> URL {
        outputDirectoryPath.appending(component: createFileName())
    }

    func createFileName() -> String {
        inputFilePath.lastPathComponent.replacingOccurrences(of: ".swift", with: "Tests+ChatGPT.swift")
    }
}

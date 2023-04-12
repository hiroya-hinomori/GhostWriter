//
//  MockGenerator.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/11.
//

import Foundation

public struct MockGenerator: GeneratorProtocol {
    let inputFilePath: URL
    let outputDirectoryPath: URL
    
    public init(inputFilePath: URL, outputDirectoryPath: URL) {
        self.inputFilePath = inputFilePath
        self.outputDirectoryPath = outputDirectoryPath
    }

    public func createOrder() -> String {
        let fileContents = try? loadInputFile(inputFilePath)
        let order = "Generate Mock class for this protocol with Swift without comment.\n\n"
        return order + (fileContents ?? "")
    }

    public func createOutputPath() -> URL {
        outputDirectoryPath.appending(component: createFileName())
    }

    func createFileName() -> String {
        let name = inputFilePath.lastPathComponent
        if name.hasSuffix("Protocol.swift") {
            return "Mock" + name.replacingOccurrences(of: "Protocol.swift", with: "+ChatGPT.swift")
        } else {
            return "Mock" + name.replacingOccurrences(of: ".swift", with: "+ChatGPT.swift")
        }
    }
    
    func loadInputFile(_ url: URL) throws -> String {
        guard FileValidator.validate(url) else {
            throw CLIError.notSupported
        }
        return try String(contentsOf: url, encoding: .utf8)
    }
}

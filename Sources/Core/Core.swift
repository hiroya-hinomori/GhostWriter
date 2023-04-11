//
//  Core.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/10.
//

import Foundation
import API

public struct Core {
    let option: Options
    
    public init(option: Options) {
        self.option = option
    }
    
    public func request() async throws {
        let fileContents = try loadInputFile(option.inputFilePath)
        let order = UnitTestGenerator.createOrder(fileContents)
        let request = OpenAIRequest(secret: option.secret, text: order)
        let result = try await Session.send(request)
        let outputContents = GenerateFileHeader.header + (result.choices.map(\.message.content).first ?? "")
        let path = option
            .outputDirectoryPath
            .appending(
                component: UnitTestGenerator
                    .createOutputFileName(option.inputFilePath.lastPathComponent)
            )
        try outputContents.write(to: path, atomically: true, encoding: .utf8)
        print("COMPLETE 🎉")
    }
    
    func loadInputFile(_ url: URL) throws -> String {
        guard FileValidator.validate(url) else {
            throw CLIError.notSupported
        }
        return try String(contentsOf: url, encoding: .utf8)
    }
}

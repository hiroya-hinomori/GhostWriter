//
//  Core.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/10.
//

import Foundation
import API

public enum Core {
    public static func request(with generator: GeneratorProtocol, secret: String) async throws {
        let request: OpenAIRequest = OpenAIRequest(secret: secret, text: generator.createOrder())
        let outputPath: URL = generator.createOutputPath()
        let result = try await Session.send(request)
        let outputContents = GenerateFileHeader.header + (result.list.first ?? "")
        try outputContents.write(to: outputPath, atomically: true, encoding: .utf8)
        print("COMPLETE 🎉")
    }
}

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
        let result = try await withThrowingTaskGroup(of: Reply?.self, returning: String.self) { group in
            var result = ""
            let loader = Loading()
            
            group.addTask {
                try await Session.send(request)
            }
            
            group.addTask {
                await loader.show()
                return nil
            }
            
            do {
                for try await reply in group {
                    if reply.isNotNil {
                        result = reply?.list.first ?? ""
                        loader.isRunning = false
                    }
                }
            } catch {
                loader.isRunning = false
                throw error
            }
            return result
        }
        
        let outputContents = GenerateFileHeader.header + result
        try outputContents.write(to: outputPath, atomically: true, encoding: .utf8)
        print("COMPLETE 🎉")
    }
}

extension Optional {
    var isNotNil: Bool {
        return self != nil
    }
}

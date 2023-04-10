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

    public func sample() async throws {
        guard FileValidator.validate(option.inputFilePath) else {
            throw CLIError.notSupported
        }
        let fileContents = try String(contentsOf: option.inputFilePath, encoding: .utf8)
        let request = OpenAIRequest(secret: option.secret, text: "Hello!")
        let result = try await Session.send(request)
        print(result.choices.first?.message.content)
    }
}

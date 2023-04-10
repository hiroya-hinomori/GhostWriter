//
//  Core.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/10.
//

import Foundation

public struct Core {
    let option: Options
    
    public init(option: Options) {
        self.option = option
    }

    public func sample() throws {
        guard FileValidator.validate(option.inputFilePath) else {
            throw CLIError.notSupported
        }
        let fileContents = try String(contentsOf: option.inputFilePath, encoding: .utf8)
        print(fileContents)
    }
}

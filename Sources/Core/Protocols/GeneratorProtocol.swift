//
//  File.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/11.
//

import Foundation

public protocol GeneratorProtocol {
    func createOrder() -> String
    func createOutputPath() -> URL
}

extension GeneratorProtocol {
    func loadInputFile(_ url: URL) throws -> String {
        guard FileValidator.validate(url) else {
            throw CLIError.notSupported
        }
        return try String(contentsOf: url, encoding: .utf8)
    }
}

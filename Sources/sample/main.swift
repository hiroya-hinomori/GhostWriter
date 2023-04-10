//
//  main.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/07.
//

import Foundation
import Core
import ArgumentParser

extension CompletionKind {
    static var empty: CompletionKind {
        return .custom { _ in return [] }
    }
}

struct ChatGPTCLI_sample: ParsableCommand {
    
    @Option(name: [.long, .short], completion: .file())
    var inputFilePath: String?

    static let configuration = CommandConfiguration(
        commandName: "sample",
        abstract: "Sample CLI",
        discussion: """
        Sample CLI for call OpenAI API.
        """,
        version: "0.0.1",
        shouldDisplay: true,
        helpNames: [.long, .short]
    )

    func run() throws {
        guard let inputFilePath = inputFilePath else {
            throw CLIError.notFound
        }
        let sample = Core(
            option: .init(
                inputFilePath: URL(fileURLWithPath: inputFilePath)
            )
        )
        try sample.sample()
    }
}

ChatGPTCLI_sample.main()

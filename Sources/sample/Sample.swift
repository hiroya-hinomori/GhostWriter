//
//  Sample.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/10.
//

import Foundation
import Core
import ArgumentParser

extension CompletionKind {
    static var empty: CompletionKind {
        return .custom { _ in return [] }
    }
}

@main
struct Sample: AsyncParsableCommand {
    @Option(name: [.long, .short], completion: .file())
    var inputFilePath: String?

    @Option(name: [.long, .customShort("k")], completion: .file())
    var openAIAPIKey: String?

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

    func run() async throws {
        guard let inputFilePath = inputFilePath else {
            throw CLIError.notFound
        }
        let sample = Core(
            option: .init(
                inputFilePath: URL(fileURLWithPath: inputFilePath),
                secret: openAIAPIKey ?? ""
            )
        )
        try await sample.sample()
    }
}

//
//  MockGen.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/11.
//

import Foundation
import Core
import ArgumentParser

@main
struct MockGen: AsyncParsableCommand {
    @Option(name: [.long, .short], completion: .file())
    var inputFilePath: String?

    @Option(name: [.long, .short], completion: .file())
    var outputDirectoryPath: String?

    @Option(name: [.long, .customShort("k")], completion: .file())
    var openAIAPIKey: String?

    static let configuration = CommandConfiguration(
        commandName: "mockgen",
        abstract: "Mock Generator",
        discussion: """
        Generate Mock file via OpenAI API
        """,
        version: "0.0.1",
        shouldDisplay: true,
        helpNames: [.long, .short]
    )

    func run() async throws {
        guard let inputFilePath = inputFilePath, let outputDirectoryPath = outputDirectoryPath else {
            throw CLIError.notFound
        }
        try await Core.request(
            with: MockGenerator(
                inputFilePath: URL(fileURLWithPath: inputFilePath),
                outputDirectoryPath: URL(fileURLWithPath: outputDirectoryPath, isDirectory: true)
            ),
            secret: openAIAPIKey ?? ""
        )
    }
}

//
//  MapperWriter.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/12.
//

import Foundation
import Core
import ArgumentParser

@main
struct MapperWriter: AsyncParsableCommand {
    @Option(name: [.long, .short], completion: .file())
    var sourceFilePath: String?

    @Option(name: [.long, .short], completion: .file())
    var destinationFilePath: String?

    @Option(name: [.long, .short], completion: .file())
    var outputDirectoryPath: String?

    @Option(name: [.long, .customShort("k")], completion: .file())
    var openAIAPIKeyFilePath: String = Constants.apiKeyFileDefaultPath

    static let configuration = CommandConfiguration(
        commandName: "mapperwriter",
        abstract: "Mapper Generator",
        discussion: """
        Generate Mapper file via OpenAI API
        """,
        version: Constants.version,
        shouldDisplay: true,
        helpNames: [.long, .short]
    )

    func run() async throws {
        guard let sourceFilePath = sourceFilePath, let destinationFilePath = destinationFilePath, let outputDirectoryPath = outputDirectoryPath else {
            throw CLIError.notFound
        }
        try await Core.request(
            with: MapperGenerator(
                sourceFilePath: URL(fileURLWithPath: sourceFilePath),
                destinationFilePath: URL(fileURLWithPath: destinationFilePath),
                outputDirectoryPath: URL(fileURLWithPath: outputDirectoryPath, isDirectory: true)
            ),
            openAIAPIKeyFilePath: URL(fileURLWithPath: openAIAPIKeyFilePath)
        )
    }
}

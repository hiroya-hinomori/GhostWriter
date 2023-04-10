//
//  main.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/07.
//

import Foundation
import ChatGPTCLICore
import ArgumentParser

extension CompletionKind {
    static var empty: CompletionKind {
        return .custom { _ in return [] }
    }
}

struct ChatGPTCLI_sample: ParsableCommand {
    
    @Option(name: .long, completion: .empty)
    var x: Int?
    
    @Option(name: .long, completion: .empty)
    var y: Int?

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
        let sample = SampleCore(x: x ?? 0, y: y ?? 0)
        sample.sample()
    }
}

ChatGPTCLI_sample.main()

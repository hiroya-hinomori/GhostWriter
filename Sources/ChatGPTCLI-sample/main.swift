//
//  main.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/07.
//

import Foundation
import ChatGPTCLICore
import ArgumentParser

struct ChatGPTCLI_sample: ParsableCommand {
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
        SampleCore.print()
    }
}

ChatGPTCLI_sample.main()

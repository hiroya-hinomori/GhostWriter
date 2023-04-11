//
//  Options.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/10.
//

import Foundation

public struct Options {
    let inputFilePath: URL
    let outputDirectoryPath: URL
    let secret: String
    
    public init(inputFilePath: URL, outputDirectoryPath: URL, secret: String) {
        self.inputFilePath = inputFilePath
        self.outputDirectoryPath = outputDirectoryPath
        self.secret = secret
    }
}

//
//  FileValidator.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/10.
//

import Foundation

enum FileValidator {
    static func validate(_ url: URL) -> Bool {
        url.lastPathComponent.hasSuffix(".swift")
    }
}

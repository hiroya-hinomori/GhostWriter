//
//  File.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/11.
//

import ArgumentParser

extension CompletionKind {
    static var empty: CompletionKind {
        return .custom { _ in return [] }
    }
}

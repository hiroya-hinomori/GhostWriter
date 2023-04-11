//
//  UnitTestGenerator.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/11.
//

import Foundation

enum UnitTestGenerator {
    static func createOrder(_ content: String) -> String {
        let order = "Generate unit test for this codes with Swift without comment.\n\n"
        return order + content
    }
    
    static func createOutputFileName(_ name: String) -> String {
        name.replacingOccurrences(of: ".swift", with: "Tests+ChatGPT.swift")
    }
}

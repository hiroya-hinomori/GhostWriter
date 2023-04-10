//
//  SampleCore.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/10.
//

import Foundation

public enum SampleCore {
    public static func print() {
        Swift.print("Sample CORE!!!")
        let arguments = CommandLine.arguments
        guard arguments.count == 3,
              let x = Int(arguments[1]),
              let y = Int(arguments[2]) else {
            Swift.print("Usage: $ swift run sample <x> <y>")
            exit(1)
        }
        let result = x + y
        Swift.print("Result: \(result)")
    }
}

//
//  File.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/11.
//

import Foundation

public protocol GeneratorProtocol {
    func createOrder() -> String
    func createOutputPath() -> URL
}

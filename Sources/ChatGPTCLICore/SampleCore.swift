//
//  SampleCore.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/10.
//

import Foundation

public struct SampleCore {
    let x: Int
    let y: Int
    
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    public func sample() {
        print("Sample CORE!!!")
        let result = x + y
        print("Result: \(result)")
    }
}

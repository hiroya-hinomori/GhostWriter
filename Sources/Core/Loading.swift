//
//  Loading.swift
//  Core
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/13.
//

import Foundation

class Loading {
    var isRunning = true
    var count = 0
    
    func show() async {
        print("Now loading... Please wait for a few minutes.")
        while isRunning {
            try? await Task.sleep(for: .seconds(1))
            count = resetIfNeeded(increment(count))
            print(String(repeating:"🏎  ", count:count))
        }
    }
    
    func increment(_ value: Int) -> Int {
        value + 1
    }
    
    func resetIfNeeded(_ value: Int) -> Int {
        if value % 11 == 0 {
            return 0
        }
        return value
    }
}

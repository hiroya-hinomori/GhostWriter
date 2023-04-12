//
//  HogeProtocol.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/12.
//

import Foundation

protocol HogeProtocol {
    var title: String { get }
    var index: Int { set get }
    
    func something(with value: String) -> Something
}

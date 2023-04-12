//
//  File.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/10.
//

import Foundation

public struct Reply: Decodable {
    public let list: [String]
    
    enum RootKeys: String, CodingKey {
        case choices
    }
    
    enum ChoiceKeys: String, CodingKey {
        case message
    }
    
    enum MessageKeys: String, CodingKey {
        case content
    }

    public init(from decoder: Decoder) throws {
        let root = try decoder.container(keyedBy: RootKeys.self)
        var choices = try root.nestedUnkeyedContainer(forKey: .choices)
        var list: [String] = []
        while !choices.isAtEnd {
            let container = try choices.nestedContainer(keyedBy: ChoiceKeys.self)
            let message = try container.nestedContainer(keyedBy: MessageKeys.self, forKey: .message)
            let text = try message.decode(String.self, forKey: .content)
            list.append(text)
        }
        self.list = list
    }
}

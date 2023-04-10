//
//  File.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/10.
//

import Foundation

public struct ReplyList: Decodable {
    public let id: String
    public let object: String
    public let created: Int
    public let model: String
    
    public struct Usage: Decodable {
        enum CodingKeys: String, CodingKey {
            case promptTokens = "prompt_tokens"
            case completionTokens = "completion_tokens"
            case totalTokens = "total_tokens"
        }

        public let promptTokens: Int
        public let completionTokens: Int
        public let totalTokens: Int
    }
    
    public let usage: Usage
    public let choices: [Reply]
}

public struct Reply: Decodable {
    enum CodingKeys: String, CodingKey {
        case message
        case finishReason = "finish_reason"
        case index
    }
    public struct Message: Decodable {
        public let role: String
        public let content: String
    }
    public let message: Message
    public let finishReason: String
    public let index: Int
}

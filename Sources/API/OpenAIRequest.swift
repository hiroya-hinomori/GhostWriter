//
//  OpenAIRequest.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/10.
//

import Foundation
import APIKit

public struct OpenAIRequest: HTTPRequestProtocol {
    public typealias Response = Reply
    
    public var sample: Data {
        .init()
    }
    
    public var baseURL: URL = .init(string: "https://api.openai.com")!
    
    public var method: APIKit.HTTPMethod = .post
    
    public var path: String = "/v1/chat/completions"
    
    public var headerFields: [String : String] {
        [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(secret)"
        ]
    }
    
    public var bodyParameters: BodyParameters? {
        JSONBodyParameters(
            JSONObject:[
                "model": "gpt-3.5-turbo",
                "messages": [
                    [
                        "role": "user",
                        "content": text
                    ]
                ]
            ]
        )
    }

    let secret: String
    let text: String
    
    public init(secret: String, text: String) {
        self.secret = secret
        self.text = text
    }
}

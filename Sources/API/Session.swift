//
//  File.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/10.
//

import Foundation
import APIKit

public enum Session {
    public static func send<Request>(_ request: Request) async throws -> Request.Response where Request: HTTPRequestProtocol {
        try await withCheckedThrowingContinuation { continuation in
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = 180
            APIKit
                .Session(adapter: URLSessionAdapter(configuration: config))
                .send(request) { response in
                    do {
                        continuation.resume(returning: try response.get())
                    } catch APIKit.SessionTaskError.responseError(let error) {
                        continuation.resume(throwing: error)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
}

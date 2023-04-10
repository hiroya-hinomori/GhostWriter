//
//  File.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/10.
//

import APIKit
import Foundation

public protocol HTTPRequestProtocol: Request where Response: Decodable {
    var sample: Data { get }
}

public struct DecodableDataParser<Response: Decodable>: DataParser {
    public var contentType: String?

    public func parse(data: Data) throws -> Any {
        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        print(json ?? "")
        do {
            if data.isEmpty {
                return data
            } else {
                return try JSONDecoder().decode(Response.self, from: data)
            }
        } catch {
            throw APIError.unexpected
        }
    }
}

extension HTTPRequestProtocol {
    public var dataParser: DataParser {
        DecodableDataParser<Response>()
    }

    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        if let res = object as? Response {
            return res
        } else {
            throw APIError.unexpected
        }
    }

    public func intercept(urlRequest: URLRequest) throws -> URLRequest {
        print(Self.generateCURL(urlRequest))
        return urlRequest
    }
}

extension HTTPRequestProtocol {
    static func generateCURL(_ urlRequest: URLRequest) -> String {
        guard let url = urlRequest.url else { return "" }
        var baseCommand = "$ curl -v"
        if urlRequest.httpMethod == "HEAD" {
            baseCommand += " --head"
        }
        var command = [baseCommand]
        if let method = urlRequest.httpMethod, method != "GET" && method != "HEAD" {
            command.append("-X \(method)")
        }
        if let headers = urlRequest.allHTTPHeaderFields {
            for (key, value) in headers where key != "Cookie" {
                command.append("-H '\(key): \(value)'")
            }
        }
        if let data = urlRequest.httpBody, let body = String(data: data, encoding: .utf8) {
            command.append("-d '\(body)'")
        }
        command.append("\"\(url.absoluteString)\"")
        return command.joined(separator: " \\\n\t")
    }
}

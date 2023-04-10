//
//  FileValidatorTests.swift
//  
//
//  Created by 日野森 寛也（Hiroya Hinomori） on 2023/04/10.
//

import XCTest
@testable import ChatGPTCLICore

final class FileValidatorTests: XCTestCase {
    
    func testValidateWithSwiftFile() {
        // Given
        let url = URL(fileURLWithPath: "path/to/sample.swift")
        
        // When
        let result = FileValidator.validate(url)
        
        // Then
        XCTAssertTrue(result) // should return true for a .swift file
    }
    
    func testValidateWithNonSwiftFile() {
        // Given
        let url = URL(fileURLWithPath: "path/to/sample.txt")
        
        // When
        let result = FileValidator.validate(url)
        
        // Then
        XCTAssertFalse(result) // should return false for a non-.swift file
    }
}

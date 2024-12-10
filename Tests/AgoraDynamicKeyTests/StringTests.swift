//
//  StringTests.swift
//  agora-dynamic-key-swift
//
//  Created by Giacomo Leopizzi on 09/12/24.
//

import Testing
import CAgoraDynamicKey
@testable import AgoraDynamicKey

@Suite
struct StringTests {
    
    @Test(arguments: [
        "",
        "Hello World",
        "Hello World!",
    ])
    func conversion(string: String) {
        let cxxString: std.__1.string = string.cxxString
        let swiftString = cxxString.swiftString
        #expect(swiftString == string)
        #expect(cxxString == std.__1.string(string))
    }
}

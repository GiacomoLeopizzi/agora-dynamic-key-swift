//
//  TimeAmountTests.swift
//  agora-dynamic-key-swift
//
//  Created by Giacomo Leopizzi on 09/12/24.
//

import NIO
import Testing
@testable import AgoraDynamicKey

@Suite
struct TimeAmountTests {
    
    @Test
    func seconds() {
        let random = UInt32.random(in: UInt32.zero...UInt32.max)
        let timeAmount = TimeAmount.seconds(Int64(random))
        #expect(timeAmount.seconds == random)
    }
}

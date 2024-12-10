//
//  TimeAmount-Extension.swift
//  agora-dynamic-key-swift
//
//  Created by Giacomo Leopizzi on 09/12/24.
//

import CAgoraDynamicKey
import struct NIO.TimeAmount

extension TimeAmount {

    var seconds: UInt32 {
        UInt32(self.nanoseconds / (1000 * 1000 * 1000))
    }
}

//
//  TestConstant.swift
//  agora-dynamic-key-swift
//
//  Created by Giacomo Leopizzi on 09/12/24.
//

import NIO

struct TestConstant {
    static let appID = "970CA35de60c44645bbae8a215061b33"
    static let appCertificate = "5CFd2fd1755d40ecb72977518be15d3b"
    static let userID = "test_user"
    static let uid: UInt32 = 2882341273
    static let expire: TimeAmount = .seconds(900)
    static let channelName = "test_channel"
}

//
//  UserRoleTests.swift
//  agora-dynamic-key-swift
//
//  Created by Giacomo Leopizzi on 09/12/24.
//

import Testing
import CAgoraDynamicKey
@testable import AgoraDynamicKey

@Suite
struct UserRoleTests {
    
    @Test
    func rolePublisher() {
        #expect(RtcTokenBuilder.UserRole.rolePublisher.agora == agora.tools.UserRole.rolePublisher)
    }
    
    @Test
    func roleSubscriber() {
        #expect(RtcTokenBuilder.UserRole.roleSubscriber.agora == agora.tools.UserRole.roleSubscriber)
    }
}

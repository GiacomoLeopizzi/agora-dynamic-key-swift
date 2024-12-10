//
//  ChatTokenBuilderTests.swift
//  agora-dynamic-key-swift
//
//  Created by Giacomo Leopizzi on 10/12/24.
//

import Testing
import CAgoraDynamicKey
@testable import AgoraDynamicKey

@Suite
struct ChatTokenBuilderTests {
    
    @Test
    func buildAppToken() {
        let builder = ChatTokenBuilder(appID: TestConstant.appID, appCertificate: TestConstant.appCertificate)
        let token = builder.buildAppToken(expire: TestConstant.expire)
        
        var parser = agora.tools.AccessToken2.init("".cxxString, "".cxxString, 0, 0)
        let parsed = parser.FromString(token.cxxString)
        
        #expect(parser.signature_ == parser.GenerateSignature(TestConstant.appCertificate.cxxString))
        #expect(parsed)
        
        #expect(parser.app_id_ == TestConstant.appID.cxxString)
        #expect(parser.expire_ == TestConstant.expire.seconds)
        
        #expect(GetServiceCount(&parser) == 1)
        #expect(GetFirstServiceChatAppPrivilege(&parser) == TestConstant.expire.seconds)
    }
    
    @Test
    func buildUserToken() {
        let builder = ChatTokenBuilder(appID: TestConstant.appID, appCertificate: TestConstant.appCertificate)
        let token = builder.buildUserToken(userID: TestConstant.userID, expire: TestConstant.expire)
        
        var parser = agora.tools.AccessToken2.init("".cxxString, "".cxxString, 0, 0)
        let parsed = parser.FromString(token.cxxString)
        
        #expect(parser.signature_ == parser.GenerateSignature(TestConstant.appCertificate.cxxString))
        #expect(parsed)
        
        #expect(parser.app_id_ == TestConstant.appID.cxxString)
        #expect(parser.expire_ == TestConstant.expire.seconds)
        
        #expect(GetServiceCount(&parser) == 1)
        #expect(String(cString: GetFirstServiceChatUserId(&parser)) == TestConstant.userID)
        #expect(GetFirstServiceChatUserPrivilege(&parser) == TestConstant.expire.seconds)
    }
}

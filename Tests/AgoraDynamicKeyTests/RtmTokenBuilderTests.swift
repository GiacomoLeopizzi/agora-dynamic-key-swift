//
//  RtmTokenBuilderTests.swift
//  agora-dynamic-key-swift
//
//  Created by Giacomo Leopizzi on 09/12/24.
//

import Testing
import CAgoraDynamicKey
@testable import AgoraDynamicKey

@Suite
struct RtmTokenBuilderTests {
    
    @Test
    func buildToken() {
        let builder = RtmTokenBuilder(appID: TestConstant.appID, appCertificate: TestConstant.appCertificate)
        let token = builder.buildToken(userID: TestConstant.userID, expire: TestConstant.expire)
        
        var parser = agora.tools.AccessToken2.init("".cxxString, "".cxxString, 0, 0)
        let parsed = parser.FromString(token.cxxString)
        
        #expect(parser.signature_ == parser.GenerateSignature(TestConstant.appCertificate.cxxString))
        #expect(parsed)
        
        #expect(parser.app_id_ == TestConstant.appID.cxxString)
        #expect(parser.expire_ == TestConstant.expire.seconds)
        
        #expect(GetServiceCount(&parser) == 1)
        #expect(String(cString: GetFirstServiceRtmUserId(&parser)) == TestConstant.userID)
        #expect(GetFirstServiceRtmLoginPrivilege(&parser) == TestConstant.expire.seconds)
    }
}

//
//  RtcTokenBuilderTests.swift
//  agora-dynamic-key-swift
//
//  Created by Giacomo Leopizzi on 10/12/24.
//

import NIO
import Testing
import CAgoraDynamicKey
@testable import AgoraDynamicKey

@Suite
struct RtcTokenBuilderTests {
    
    @Test
    func buildTokenWithRtm() {
        let builder = RtcTokenBuilder(appID: TestConstant.appID, appCertificate: TestConstant.appCertificate)
        
        let privilegeExpire = TimeAmount.seconds(Int64.random(in: 10...99_999))
        let token = builder.buildTokenWithRtm(channelName: TestConstant.channelName,
                                              userAccount: String(TestConstant.uid),
                                              role: .rolePublisher,
                                              tokenExpire: TestConstant.expire,
                                              privilegeExpire: privilegeExpire)
        
        var parser = agora.tools.AccessToken2.init("".cxxString, "".cxxString, 0, 0)
        let parsed = parser.FromString(token.cxxString)
        
        #expect(parser.signature_ == parser.GenerateSignature(TestConstant.appCertificate.cxxString))
        #expect(parsed)
        
        #expect(parser.app_id_ == TestConstant.appID.cxxString)
        #expect(parser.expire_ == TestConstant.expire.seconds)
        
        #expect(GetServiceCount(&parser) == 2)
        
        #expect(String(cString: GetFirstServiceRtcChannelName(&parser)) == TestConstant.channelName)
        #expect(String(cString: GetFirstServiceRtcAccount(&parser)) == String(TestConstant.uid))
        #expect(GetFirstServiceRtcJoinChannelPrivilege(&parser) == privilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishAudioPrivilege(&parser) == privilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishVideoPrivilege(&parser) == privilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishDataPrivilege(&parser) == privilegeExpire.seconds)
    }
    
    @Test
    func buildTokenWithUid1() {
        let builder = RtcTokenBuilder(appID: TestConstant.appID, appCertificate: TestConstant.appCertificate)
        
        let privilegeExpire = TimeAmount.seconds(Int64.random(in: 10...99_999))
        let token = builder.buildTokenWithUid(channelName: TestConstant.channelName,
                                              uid: TestConstant.uid,
                                              role: .rolePublisher,
                                              tokenExpire: TestConstant.expire,
                                              privilegeExpire: privilegeExpire)
        
        var parser = agora.tools.AccessToken2.init("".cxxString, "".cxxString, 0, 0)
        let parsed = parser.FromString(token.cxxString)
        
        #expect(parser.signature_ == parser.GenerateSignature(TestConstant.appCertificate.cxxString))
        #expect(parsed)
        
        #expect(parser.app_id_ == TestConstant.appID.cxxString)
        #expect(parser.expire_ == TestConstant.expire.seconds)
        
        #expect(GetServiceCount(&parser) == 1)
        
        #expect(String(cString: GetFirstServiceRtcChannelName(&parser)) == TestConstant.channelName)
        #expect(String(cString: GetFirstServiceRtcAccount(&parser)) == String(TestConstant.uid))
        #expect(GetFirstServiceRtcJoinChannelPrivilege(&parser) == privilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishAudioPrivilege(&parser) == privilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishVideoPrivilege(&parser) == privilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishDataPrivilege(&parser) == privilegeExpire.seconds)
    }
    
    @Test
    func buildTokenWithUid2() {
        let builder = RtcTokenBuilder(appID: TestConstant.appID, appCertificate: TestConstant.appCertificate)
        
        let privilegeExpire = TimeAmount.seconds(Int64.random(in: 10...99_999))
        let token = builder.buildTokenWithUid(channelName: TestConstant.channelName,
                                              uid: TestConstant.uid,
                                              role: .roleSubscriber,
                                              tokenExpire: TestConstant.expire,
                                              privilegeExpire: privilegeExpire)
        
        var parser = agora.tools.AccessToken2.init("".cxxString, "".cxxString, 0, 0)
        let parsed = parser.FromString(token.cxxString)
        
        #expect(parser.signature_ == parser.GenerateSignature(TestConstant.appCertificate.cxxString))
        #expect(parsed)
        
        #expect(parser.app_id_ == TestConstant.appID.cxxString)
        #expect(parser.expire_ == TestConstant.expire.seconds)
        
        #expect(GetServiceCount(&parser) == 1)
        
        #expect(String(cString: GetFirstServiceRtcChannelName(&parser)) == TestConstant.channelName)
        #expect(String(cString: GetFirstServiceRtcAccount(&parser)) == String(TestConstant.uid))
        #expect(GetFirstServiceRtcJoinChannelPrivilege(&parser) == privilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishAudioPrivilege(&parser) == 0)
        #expect(GetFirstServiceRtcPublishVideoPrivilege(&parser) == 0)
        #expect(GetFirstServiceRtcPublishDataPrivilege(&parser) == 0)
    }
    
    @Test
    func buildTokenWithUid3() {
        let builder = RtcTokenBuilder(appID: TestConstant.appID, appCertificate: TestConstant.appCertificate)
        
        let joinChannelPrivilegeExpire = TimeAmount.seconds(Int64.random(in: 10...99_999))
        let pubAudioPrivilegeExpire = TimeAmount.seconds(Int64.random(in: 10...99_999))
        let pubVideoPrivilegeExpire = TimeAmount.seconds(Int64.random(in: 10...99_999))
        let pubDataPrivilegeExpire = TimeAmount.seconds(Int64.random(in: 10...99_999))
        
        let token = builder.buildTokenWithUid(channelName: TestConstant.channelName,
                                              uid: TestConstant.uid,
                                              tokenExpire: TestConstant.expire,
                                              joinChannelPrivilegeExpire: joinChannelPrivilegeExpire,
                                              pubAudioPrivilegeExpire: pubAudioPrivilegeExpire,
                                              pubVideoPrivilegeExpire: pubVideoPrivilegeExpire,
                                              pubDataPrivilegeExpire: pubDataPrivilegeExpire)
        
        var parser = agora.tools.AccessToken2.init("".cxxString, "".cxxString, 0, 0)
        let parsed = parser.FromString(token.cxxString)
        
        #expect(parser.signature_ == parser.GenerateSignature(TestConstant.appCertificate.cxxString))
        #expect(parsed)
        
        #expect(parser.app_id_ == TestConstant.appID.cxxString)
        #expect(parser.expire_ == TestConstant.expire.seconds)
        
        #expect(GetServiceCount(&parser) == 1)
        
        #expect(String(cString: GetFirstServiceRtcChannelName(&parser)) == TestConstant.channelName)
        #expect(String(cString: GetFirstServiceRtcAccount(&parser)) == String(TestConstant.uid))
        #expect(GetFirstServiceRtcJoinChannelPrivilege(&parser) == joinChannelPrivilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishAudioPrivilege(&parser) == pubAudioPrivilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishVideoPrivilege(&parser) == pubVideoPrivilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishDataPrivilege(&parser) == pubDataPrivilegeExpire.seconds)
    }
    
    @Test
    func buildTokenWithUserAccount1() {
        let builder = RtcTokenBuilder(appID: TestConstant.appID, appCertificate: TestConstant.appCertificate)
        
        let privilegeExpire = TimeAmount.seconds(Int64.random(in: 10...99_999))
        let token = builder.buildTokenWithUserAccount(channelName: TestConstant.channelName,
                                                      userAccount: String(TestConstant.uid),
                                                      role: .rolePublisher,
                                                      tokenExpire: TestConstant.expire,
                                                      privilegeExpire: privilegeExpire)
        
        var parser = agora.tools.AccessToken2.init("".cxxString, "".cxxString, 0, 0)
        let parsed = parser.FromString(token.cxxString)
        
        #expect(parser.signature_ == parser.GenerateSignature(TestConstant.appCertificate.cxxString))
        #expect(parsed)
        
        #expect(parser.app_id_ == TestConstant.appID.cxxString)
        #expect(parser.expire_ == TestConstant.expire.seconds)
        
        #expect(GetServiceCount(&parser) == 1)
        
        #expect(String(cString: GetFirstServiceRtcChannelName(&parser)) == TestConstant.channelName)
        #expect(String(cString: GetFirstServiceRtcAccount(&parser)) == String(TestConstant.uid))
        #expect(GetFirstServiceRtcJoinChannelPrivilege(&parser) == privilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishAudioPrivilege(&parser) == privilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishVideoPrivilege(&parser) == privilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishDataPrivilege(&parser) == privilegeExpire.seconds)
    }
    
    @Test
    func buildTokenWithUserAccount2() {
        let builder = RtcTokenBuilder(appID: TestConstant.appID, appCertificate: TestConstant.appCertificate)
        
        let privilegeExpire = TimeAmount.seconds(Int64.random(in: 10...99_999))
        let token = builder.buildTokenWithUserAccount(channelName: TestConstant.channelName,
                                                      userAccount: String(TestConstant.uid),
                                                      role: .roleSubscriber,
                                                      tokenExpire: TestConstant.expire,
                                                      privilegeExpire: privilegeExpire)
        
        var parser = agora.tools.AccessToken2.init("".cxxString, "".cxxString, 0, 0)
        let parsed = parser.FromString(token.cxxString)
        
        #expect(parser.signature_ == parser.GenerateSignature(TestConstant.appCertificate.cxxString))
        #expect(parsed)
        
        #expect(parser.app_id_ == TestConstant.appID.cxxString)
        #expect(parser.expire_ == TestConstant.expire.seconds)
        
        #expect(GetServiceCount(&parser) == 1)
        
        #expect(String(cString: GetFirstServiceRtcChannelName(&parser)) == TestConstant.channelName)
        #expect(String(cString: GetFirstServiceRtcAccount(&parser)) == String(TestConstant.uid))
        #expect(GetFirstServiceRtcJoinChannelPrivilege(&parser) == privilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishAudioPrivilege(&parser) == 0)
        #expect(GetFirstServiceRtcPublishVideoPrivilege(&parser) == 0)
        #expect(GetFirstServiceRtcPublishDataPrivilege(&parser) == 0)
    }
    
    @Test
    func buildTokenWithUserAccount3() {
        let builder = RtcTokenBuilder(appID: TestConstant.appID, appCertificate: TestConstant.appCertificate)
        
        let joinChannelPrivilegeExpire = TimeAmount.seconds(Int64.random(in: 10...99_999))
        let pubAudioPrivilegeExpire = TimeAmount.seconds(Int64.random(in: 10...99_999))
        let pubVideoPrivilegeExpire = TimeAmount.seconds(Int64.random(in: 10...99_999))
        let pubDataPrivilegeExpire = TimeAmount.seconds(Int64.random(in: 10...99_999))
        
        let token = builder.buildTokenWithUserAccount(channelName: TestConstant.channelName,
                                                      userAccount: String(TestConstant.uid),
                                                      tokenExpire: TestConstant.expire,
                                                      joinChannelPrivilegeExpire: joinChannelPrivilegeExpire,
                                                      pubAudioPrivilegeExpire: pubAudioPrivilegeExpire,
                                                      pubVideoPrivilegeExpire: pubVideoPrivilegeExpire,
                                                      pubDataPrivilegeExpire: pubDataPrivilegeExpire)
        
        var parser = agora.tools.AccessToken2.init("".cxxString, "".cxxString, 0, 0)
        let parsed = parser.FromString(token.cxxString)
        
        #expect(parser.signature_ == parser.GenerateSignature(TestConstant.appCertificate.cxxString))
        #expect(parsed)
        
        #expect(parser.app_id_ == TestConstant.appID.cxxString)
        #expect(parser.expire_ == TestConstant.expire.seconds)
        
        #expect(GetServiceCount(&parser) == 1)
        
        #expect(String(cString: GetFirstServiceRtcChannelName(&parser)) == TestConstant.channelName)
        #expect(String(cString: GetFirstServiceRtcAccount(&parser)) == String(TestConstant.uid))
        #expect(GetFirstServiceRtcJoinChannelPrivilege(&parser) == joinChannelPrivilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishAudioPrivilege(&parser) == pubAudioPrivilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishVideoPrivilege(&parser) == pubVideoPrivilegeExpire.seconds)
        #expect(GetFirstServiceRtcPublishDataPrivilege(&parser) == pubDataPrivilegeExpire.seconds)
    }
}

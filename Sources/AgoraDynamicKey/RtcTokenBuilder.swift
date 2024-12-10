//
//  RtcTokenBuilder.swift
//  agora-dynamic-key-swift
//
//  Created by Giacomo Leopizzi on 09/12/24.
//

import CAgoraDynamicKey
import struct NIO.TimeAmount

public struct RtcTokenBuilder: Sendable {
    
    /// The App ID of your Agora project.
    public let appID: String
    /// Certificate of the application that you registered in the Agora Dashboard.
    public let appCertificate: String
    
    /// Initializes the RtcTokenBuilder with the provided App ID and App Certificate.
    /// - Parameters:
    ///   - appID: The App ID of your Agora project.
    ///   - appCertificate: The App Certificate from the Agora Dashboard.
    public init(appID: String, appCertificate: String) {
        self.appID = appID
        self.appCertificate = appCertificate
    }
    
    /// Builds an RTC and RTM token with a user account.
    /// - Parameters:
    ///   - channelName: Unique channel name for the AgoraRTC session. Length must be less than 64 bytes. Supported characters include:
    ///     - Lowercase English letters: a-z.
    ///     - Uppercase English letters: A-Z.
    ///     - Digits: 0-9.
    ///     - Space and symbols: "!", "#", "$", "%", "&", "(", ")", "+", "-", ":", ";", "<", "=", ".", ">", "?", "@", "[", "]", "^", "_", "{", "}", "|", "~", ",".
    ///   - userAccount: The user account.
    ///   - role: User role in the session. Options are:
    ///     - `Role_Publisher`: Use for a voice/video call or live broadcast.
    ///     - `Role_Subscriber`: Use for live-broadcast scenarios requiring co-host authentication.
    ///   - tokenExpire: The number of seconds before the token expires.
    ///   - privilegeExpire: The number of seconds before privileges expire. Defaults to `.zero`.
    /// - Returns: The RTC and RTM token as a `String`.
    public func buildTokenWithRtm(channelName: String, userAccount: String, role: UserRole, tokenExpire: TimeAmount, privilegeExpire: TimeAmount = .zero) -> String {
        let token = agora.tools.RtcTokenBuilder2.BuildTokenWithRtm(appID.cxxString,
                                                                   appCertificate.cxxString,
                                                                   channelName.cxxString,
                                                                   userAccount.cxxString,
                                                                   role.agora,
                                                                   tokenExpire.seconds,
                                                                   privilegeExpire.seconds)
        
        return String(token)
    }
    
    /// Builds an RTC token using a UID.
    /// - Parameters:
    ///   - channelName: Unique channel name for the AgoraRTC session.
    ///   - uid: User ID as a 32-bit unsigned integer (1 to 2^32-1).
    ///   - role: User role in the session.
    ///   - tokenExpire: The number of seconds before the token expires.
    ///   - privilegeExpire: The number of seconds before privileges expire. Defaults to `.zero`.
    /// - Returns: The generated RTC token as a `String`.
    public func buildTokenWithUid(channelName: String, uid: UInt32, role: UserRole, tokenExpire: TimeAmount, privilegeExpire: TimeAmount = .zero) -> String {
        let token = agora.tools.RtcTokenBuilder2.BuildTokenWithUid(appID.cxxString,
                                                                   appCertificate.cxxString,
                                                                   channelName.cxxString,
                                                                   uid,
                                                                   role.agora,
                                                                   tokenExpire.seconds,
                                                                   privilegeExpire.seconds)
        
        return String(token)
    }
    
    /// Generates a RTC token with specific privileges.
    /// - Parameters:
    ///   - channelName: Unique channel name for the AgoraRTC session.
    ///   - uid: User ID as a 32-bit unsigned integer.
    ///   - tokenExpire: The number of seconds before the token expires.
    ///   - joinChannelPrivilegeExpire: The number of seconds before the join channel privilege expires. Defaults to `.zero`.
    ///   - pubAudioPrivilegeExpire: The number of seconds before the audio publishing privilege expires. Defaults to `.zero`.
    ///   - pubVideoPrivilegeExpire: The number of seconds before the video publishing privilege expires. Defaults to `.zero`.
    ///   - pubDataPrivilegeExpire: The number of seconds before the data stream publishing privilege expires. Defaults to `.zero`.
    /// - Returns: The generated RTC token as a `String`.
    public func buildTokenWithUid(channelName: String, uid: UInt32, tokenExpire: TimeAmount, joinChannelPrivilegeExpire: TimeAmount = .zero, pubAudioPrivilegeExpire: TimeAmount = .zero, pubVideoPrivilegeExpire: TimeAmount = .zero, pubDataPrivilegeExpire: TimeAmount = .zero) -> String {
        let token = agora.tools.RtcTokenBuilder2.BuildTokenWithUid(appID.cxxString,
                                                                   appCertificate.cxxString,
                                                                   channelName.cxxString,
                                                                   uid,
                                                                   tokenExpire.seconds,
                                                                   joinChannelPrivilegeExpire.seconds,
                                                                   pubAudioPrivilegeExpire.seconds,
                                                                   pubVideoPrivilegeExpire.seconds,
                                                                   pubDataPrivilegeExpire.seconds)
        
        return String(token)
    }
    
    /// Builds an RTC token using a string user account.
    /// - Parameters:
    ///   - channelName: Unique channel name for the AgoraRTC session.
    ///   - userAccount: The user account.
    ///   - role: User role in the session.
    ///   - tokenExpire: The number of seconds before the token expires.
    ///   - privilegeExpire: The number of seconds before privileges expire. Defaults to `.zero`.
    /// - Returns: The generated RTC token as a `String`.
    public func buildTokenWithUserAccount(channelName: String, userAccount: String, role: UserRole, tokenExpire: TimeAmount, privilegeExpire: TimeAmount = .zero) -> String {
        let token = agora.tools.RtcTokenBuilder2.BuildTokenWithUserAccount(appID.cxxString,
                                                                           appCertificate.cxxString,
                                                                           channelName.cxxString,
                                                                           userAccount.cxxString,
                                                                           role.agora,
                                                                           tokenExpire.seconds,
                                                                           privilegeExpire.seconds)
        
        return String(token)
    }
    
    /// Generates a RTC token with specific privileges.
    /// - Parameters:
    ///   - channelName: Unique channel name for the AgoraRTC session.
    ///   - userAccount: The user account.
    ///   - tokenExpire: The number of seconds before the token expires.
    ///   - joinChannelPrivilegeExpire: The number of seconds before the join channel privilege expires. Defaults to `.zero`.
    ///   - pubAudioPrivilegeExpire: The number of seconds before the audio publishing privilege expires. Defaults to `.zero`.
    ///   - pubVideoPrivilegeExpire: The number of seconds before the video publishing privilege expires. Defaults to `.zero`.
    ///   - pubDataPrivilegeExpire: The number of seconds before the data stream publishing privilege expires. Defaults to `.zero`.
    /// - Returns: The generated RTC token as a `String`.
    public func buildTokenWithUserAccount(channelName: String, userAccount: String, tokenExpire: TimeAmount, joinChannelPrivilegeExpire: TimeAmount = .zero, pubAudioPrivilegeExpire: TimeAmount = .zero, pubVideoPrivilegeExpire: TimeAmount = .zero, pubDataPrivilegeExpire: TimeAmount = .zero) -> String {
        let token = agora.tools.RtcTokenBuilder2.BuildTokenWithUserAccount(appID.cxxString,
                                                                           appCertificate.cxxString,
                                                                           channelName.cxxString,
                                                                           userAccount.cxxString,
                                                                           tokenExpire.seconds,
                                                                           joinChannelPrivilegeExpire.seconds,
                                                                           pubAudioPrivilegeExpire.seconds,
                                                                           pubVideoPrivilegeExpire.seconds,
                                                                           pubDataPrivilegeExpire.seconds)
        
        return String(token)
    }
}

//
//  RtmTokenBuilder.swift
//  agora-dynamic-key-swift
//
//  Created by Giacomo Leopizzi on 09/12/24.
//

import CAgoraDynamicKey
import struct NIO.TimeAmount

public struct RtmTokenBuilder: Sendable {
    
    /// The App ID of your Agora project.
    public let appID: String
    /// Certificate of the application that you registered in the Agora Dashboard.
    public let appCertificate: String
    
    /// Initializes the RtmTokenBuilder with the provided App ID and App Certificate.
    /// - Parameters:
    ///   - appID: The App ID of your Agora project.
    ///   - appCertificate: The App Certificate from the Agora Dashboard.
    public init(appID: String, appCertificate: String) {
        self.appID = appID
        self.appCertificate = appCertificate
    }
    
    /// Builds an RTM token.
    /// - Parameters:
    ///   - userID: The user's account. Maximum length is 64 bytes.
    ///   - expire: The duration (in seconds) for which the token is valid. For example, to access the Agora Service for 10 minutes after the token is generated, set `expire` to 600 seconds. Defaults to `.zero`.
    /// - Returns: The generated RTM token as a `String`.
    public func buildToken(userID: String, expire: TimeAmount = .zero) -> String {
        let token = agora.tools.RtmTokenBuilder2.BuildToken(appID.cxxString,
                                                            appCertificate.cxxString,
                                                            userID.cxxString,
                                                            expire.seconds)
   
        return String(token)
    }
}

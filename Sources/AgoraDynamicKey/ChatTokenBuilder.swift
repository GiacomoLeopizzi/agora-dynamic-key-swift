//
//  ChatTokenBuilder.swift
//  agora-dynamic-key-swift
//
//  Created by Giacomo Leopizzi on 09/12/24.
//

import CAgoraDynamicKey
import struct NIO.TimeAmount

public struct ChatTokenBuilder: Sendable {
    
    /// The App ID of your Agora project.
    public let appID: String
    /// Certificate of the application that you registered in the Agora Dashboard.
    public let appCertificate: String
    
    /// Initializes the ChatTokenBuilder with the provided App ID and App Certificate.
    /// - Parameters:
    ///   - appID: The App ID of your Agora project.
    ///   - appCertificate: The App Certificate from the Agora Dashboard.
    public init(appID: String, appCertificate: String) {
        self.appID = appID
        self.appCertificate = appCertificate
    }
    
    /// Builds a Chat App token.
    /// - Parameter expire: The number of seconds until the token expires. For example, to access the Agora Service for 10 minutes after the token is generated, set `expire` to 600 seconds. Defaults to `.zero`.
    /// - Returns: The Chat App token as a `String`.
    public func buildAppToken(expire: TimeAmount = .zero) -> String {
        let token = agora.tools.ChatTokenBuilder2.BuildAppToken(appID.cxxString,
                                                                appCertificate.cxxString,
                                                                expire.seconds)
        
        return String(token)
    }
    
    /// Builds a Chat User token.
    /// - Parameters:
    ///   - userID: The unique ID of the user.
    ///   - expire: The number of seconds until the token expires. For example, to access the Agora Service for 10 minutes after the token is generated, set `expire` to 600 seconds. Defaults to `.zero`.
    /// - Returns: The Chat User token as a `String`.
    public func buildUserToken(userID: String, expire: TimeAmount = .zero) -> String {
        let token = agora.tools.ChatTokenBuilder2.BuildUserToken(appID.cxxString,
                                                                 appCertificate.cxxString,
                                                                 userID.cxxString,
                                                                 expire.seconds)

        return String(token)
    }
}

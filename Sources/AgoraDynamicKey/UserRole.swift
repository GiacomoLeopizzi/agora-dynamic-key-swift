//
//  UserRole.swift
//  agora-dynamic-key-swift
//
//  Created by Giacomo Leopizzi on 09/12/24.
//

import CAgoraDynamicKey

extension RtcTokenBuilder {
    
    public enum UserRole: Sendable {
        case rolePublisher
        case roleSubscriber
        
        var agora: agora.tools.UserRole {
            switch self {
            case .rolePublisher:  return .rolePublisher
            case .roleSubscriber: return .roleSubscriber
            }
        }
    }
    
}

//
//  String-Extension.swift
//  agora-dynamic-key-swift
//
//  Created by Giacomo Leopizzi on 09/12/24.
//

import CAgoraDynamicKey

extension String {
    
    var cxxString: std.string {
        std.string(self)
    }
}

extension std.string {
    
    var swiftString: String {
        String(self)
    }
}

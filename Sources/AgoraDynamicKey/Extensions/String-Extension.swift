//
//  String-Extension.swift
//  agora-dynamic-key-swift
//
//  Created by Giacomo Leopizzi on 09/12/24.
//

import CAgoraDynamicKey

extension String {
    
    var cxxString: std.__1.string {
        std.__1.string(self)
    }
}

extension std.__1.string {
    
    var swiftString: String {
        String(self)
    }
}

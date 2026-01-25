//
//  AuthResponse.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 20/1/26.
//

import Foundation

struct AuthResponse: Codable {
    var user: MainUser
    var jwtToken: String
    
    enum CodingKeys: String, CodingKey {
        case user
        case jwtToken = "token"
    }
}

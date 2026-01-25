//
//  ApiError.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 13/1/26.
//

import Foundation

struct ApiError: Error, Codable {
    let code: Int
    let message: String
    
    private enum CodingKeys: String, CodingKey {
        case code = "status"
        case message
    }
}

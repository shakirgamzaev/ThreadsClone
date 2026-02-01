//
//  User.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 13/1/26.
//

import Foundation

///This struct is used to package email and password from the MainLogin view, and send this as serialized JSON to the server for authentication
///with email and password
struct LoginInfo: Codable {
    var email: String
    var password: String
}

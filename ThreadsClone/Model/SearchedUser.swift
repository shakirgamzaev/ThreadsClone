//
//  SearchedUser.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 30/1/26.
//

import Foundation


struct SearchedUser: Codable, Identifiable {
    var id: Int64
    var userName: String
    var imageURL: String?
    var fullName: String
    var bio: String
    var numberOfFollowers: Int
    var isFollowed: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, userName, imageURL, fullName, bio, isFollowed
        case numberOfFollowers = "followersCount"
    }
}

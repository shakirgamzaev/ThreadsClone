//
//  Thread.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 28/1/26.
//

import Foundation
import SwiftUI

struct Thread: Identifiable, Codable {
    var imageURL: String?
    var userName: String
    var content: String
    var postDate: Date
    var userId: Int64 //id of the user who actually created this thread
    var id: Int64?
}

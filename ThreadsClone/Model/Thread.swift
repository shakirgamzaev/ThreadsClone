//
//  Thread.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 28/1/26.
//

import Foundation
import SwiftUI

struct Thread: Identifiable, Codable {
    private var imageURL: String? = nil
    var image: Data? = nil
    var userName: String
    var content: String
    var postDate: Date
    var userId: Int64
    
    var id: String {
       return self.userName
    }
}

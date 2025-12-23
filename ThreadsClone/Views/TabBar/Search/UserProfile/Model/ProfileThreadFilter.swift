//
//  ProfileThreadFilter.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 23/12/25.
//

import Foundation

enum ProfileThreadFilter: Int, Identifiable, CaseIterable {
    case threads
    case replies
    
    var id: Int { self.rawValue }
    var text: String {
        switch self {
            case .threads: return "Threads"
            case .replies: return "Replies"
        }
    }
    
}

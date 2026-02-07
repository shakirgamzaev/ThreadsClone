//
//  UserProfileViewModel.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 23/12/25.
//

import Foundation
import SwiftUI


///View model that fetches fetches all of the threads that a user with a certain userId posted, and a list of replies on the threads of the users.
@Observable
final class UserProfileViewModel {
    var listOfThreads: [Thread] = []
    var isFetching = true
    private let networkingManager = NetworkingManager.shared
    var errorMessage: String?
    
    
    func fetchThreadsOfThisUser(userId: Int64, jwtToken: String) async {
        isFetching = true
        defer {
            isFetching = false
        }
        
        do {
            self.listOfThreads = try await networkingManager.fetchThreadsMadeByUser(
                withUserId: userId,
                jwtToken: jwtToken
            )
        }
        catch {
            if let apiError  = error as? ApiError {
                errorMessage = apiError.message
            }
            else {
                errorMessage = error.localizedDescription
            }
        }
    }
}

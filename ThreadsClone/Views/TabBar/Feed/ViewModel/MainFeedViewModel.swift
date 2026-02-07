//
//  MainFeedViewModel.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 27/1/26.
//

import Foundation

///view model class that holds a list of threads made by users that this user follows
///
///Talks to a network manager to fetch threads from the backend and display them to the user.
@Observable
final class MainFeedViewModel {
    private let networkManager = NetworkingManager.shared
    var threads: [Thread] = []
    var isFetchingThreads = true
    var errorMessage: String?
    
    func fetchThreads(jwtToken: String) async {
        print("trying to fetch threads")
        isFetchingThreads = true
        defer{ isFetchingThreads = false }
        
        do {
            self.threads = try await networkManager.fetchThreads(jwtToken: jwtToken)
            print("finished fetching threads")
        }
        
        catch let error {
            if let apiError = error as? ApiError {
                print("Error fetching threads: \(apiError)")
                self.errorMessage = errorMessage
            }
            else {
                print(error.localizedDescription)
                self.errorMessage = error.localizedDescription
            }
        }
    }
}

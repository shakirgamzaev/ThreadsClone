//
//  UploadTweetViewModel.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 1/2/26.
//

import Foundation
import SwiftUI


@Observable
final class UploadThreadViewModel {
    var threadContent: String = ""
    private let networkManager = NetworkingManager.shared
    
    func uploadThread(jwtToken: String, mainUser: MainUser) async {
        do {
            let newThread = Thread(
                userName: mainUser.userName,
                content: threadContent,
                postDate: Date.now,
                userId: mainUser.id
            )
            let _ = try await networkManager.postThread(jwtToken: jwtToken, thread: newThread)
            print("Thread uploaded successfully")
        }
        catch {
            if let apieError = error as? ApiError {
                print(apieError.message)
            }
            else {
                print(error.localizedDescription)
            }
        }
    }
}

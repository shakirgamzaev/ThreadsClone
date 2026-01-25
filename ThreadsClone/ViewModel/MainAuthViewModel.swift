//
//  MainAuthViewModel.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 23/1/26.
//

import Foundation
import SwiftUI


///The app wide main auth view model that holds the logged in state, and the main user. 
@Observable
final class MainAuthViewModel {
    var isLoggedIn: Bool = false
    var mainUser: MainUser? = nil
    private let networkManager = NetworkingManager.shared
    
    init() {
        Task {
            await validateSession()
        }
    }
    
    
    private func validateSession() async {
        guard let token = UserDefaults.standard.string(forKey: "jwt_token") else {
            self.mainUser = nil
            return
        }
        
        do {
            let mainUser = try await networkManager.validateToken(token: token)
            self.mainUser = mainUser
            self.isLoggedIn = true
        } catch let apiError as ApiError {
            print(apiError.message)
        }
        catch {
            print(error.localizedDescription)
        }
    }
}

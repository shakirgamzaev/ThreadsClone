//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 16/12/25.
//

import Foundation
import SwiftUI

///Class that is a view model for getting login and password input from user, and then calling backend with the logic for authentication
@Observable
class LoginViewModel {
    var email: String = ""
    var password: String = ""
    var error: String = ""
    
    func login(authVM: MainAuthViewModel) async {
        defer {authVM.isCheckingAuth = false}
        
        do {
            authVM.isCheckingAuth = true
            let authResponse = try await NetworkingManager.shared.login(email: email, password: password)
            try authVM.keyChainService.saveToken(token: authResponse.jwtToken)
            authVM.jwtToken = authResponse.jwtToken
            
            withAnimation(.smooth(duration: 0.2)) {
                authVM.isLoggedIn = true
            }
        }
        catch let error as ApiError {
            print(error.message)
            self.error = error.message
            authVM.isLoggedIn = false
        }
        catch {
            print(error.localizedDescription)
            self.error = error.localizedDescription
            authVM.isLoggedIn = false
        }
    }
    
}

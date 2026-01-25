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
    
    
    func login(authVM: MainAuthViewModel) async {
        do {
            let authResponse = try await NetworkingManager.shared.login(email: email, password: password)
            try authVM.keyChainService.saveToken(token: authResponse.jwtToken)
            authVM.isLoggedIn = true
        }
        catch let error as ApiError {
            print(error.message)
            authVM.isLoggedIn = false
        }
        catch {
            print(error.localizedDescription)
            authVM.isLoggedIn = false
        }
    }
    
}

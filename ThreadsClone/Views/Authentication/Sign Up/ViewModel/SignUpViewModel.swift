//
//  SignUpViewModel.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 17/12/25.
//

import Foundation
import SwiftUI


@Observable
final class SignUpViewModel {
    var email: String = ""
    var password = ""
    var fullName: String = ""
    var userName: String = ""
    
    
    func signUp(authVM: MainAuthViewModel) async {
        defer {authVM.isCheckingAuth = false}
        
        do {
            authVM.isCheckingAuth = true
            let authResponse = try await NetworkingManager.shared.signUp(email: email, password: password, fullName: fullName, userName: userName)
            try authVM.keyChainService.saveToken(token: authResponse.jwtToken)
            authVM.jwtToken = authResponse.jwtToken
            
            withAnimation(.smooth(duration: 0.2)) {
                authVM.isLoggedIn = true
            }
        }
        catch let error as ApiError {
            print(error.message)
        }
        catch {
            print(error.localizedDescription)
        }
    }
}

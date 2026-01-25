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
        do {
            let authResponse = try await NetworkingManager.shared.signUp(email: email, password: password, fullName: fullName, userName: userName)
            try authVM.keyChainService.saveToken(token: authResponse.jwtToken)
            authVM.isLoggedIn = true
        }
        catch let error as ApiError {
            print(error.message)
        }
        catch {
            print(error.localizedDescription)
        }
    }
}

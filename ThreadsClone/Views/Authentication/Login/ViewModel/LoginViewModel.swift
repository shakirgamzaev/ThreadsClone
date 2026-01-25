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
            print(authResponse)
        }
        catch let error as ApiError {
            print(error.message)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
}

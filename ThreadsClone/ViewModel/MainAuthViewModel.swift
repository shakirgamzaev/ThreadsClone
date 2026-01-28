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
    var isValidatingUserSession = true
    var isCheckingAuth = false
    var jwtToken: String = ""
    
    private let networkManager = NetworkingManager.shared
    let keyChainService = SecureKeyChainStorage.shared
    
    init() {
        Task {
            await self.validateSession()
        }
    }
    
    
    func logout() {
        //whatever happens, if logout is called, jwtToken must be deleted
        defer{ jwtToken = "" }
        
        do {
            try keyChainService.deleteToken()
            withAnimation(.smooth(duration: 0.2)) {
                isLoggedIn = false
            }
        }
        catch {
            print(error.localizedDescription)
            withAnimation(.smooth(duration: 0.2)) {
                isLoggedIn = false
            }
        }
    }
    
    private func validateSession() async {
        isValidatingUserSession = true
        defer { isValidatingUserSession = false }
        
        do {
            guard let token = try keyChainService.getToken() else {
                self.mainUser = nil
                isLoggedIn = false
                return
            }
            
            let mainUser = try await networkManager.validateToken(token: token)
            self.mainUser = mainUser
            self.isLoggedIn = true
        }
        
        catch let apiError as ApiError {
            print(apiError.message)
        }
        catch let error as KeyChainError {
            print(error.message)
        }
        catch {
            print(error.localizedDescription)
        }
    }
}

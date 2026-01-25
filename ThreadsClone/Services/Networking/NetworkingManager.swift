//
//  NetworkingManager.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 13/1/26.
//

import Foundation




final class NetworkingManager {

    static let shared = NetworkingManager()
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private init(){}
    
    func login(email: String, password: String) async throws -> AuthResponse {
        let url = URL(string: "http://localhost:8080/api/auth/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        let userInfo = LoginInfo(email: email, password: password)
        let encoder = JSONEncoder()
        let userInfoJSON = try encoder.encode(userInfo)
        
        request.httpBody = userInfoJSON
        let (data, response) = try await URLSession.shared.data(for: request)
        let httpResponse = response as! HTTPURLResponse
        
        
        guard httpResponse.statusCode == 200 else {
            let apiError = try JSONDecoder().decode(ApiError.self, from: data)
            throw apiError
        }
        
        let authResponse = try decoder.decode(AuthResponse.self, from: data)
        return authResponse
    }
    
    
    func signUp(
        email: String,
        password: String,
        fullName: String,
        userName: String
    ) async throws -> AuthResponse {
        let url = URL(string: "http://localhost:8080/api/auth/signUp")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        let signUpInfo = SignUpInfo(email: email, password: password, fullName: fullName, userName: userName)
        let signUpInfoJSON = try encoder.encode(signUpInfo)
        
        request.httpBody = signUpInfoJSON
        let (data, response) = try await URLSession.shared.data(for: request)
        let httpResponse = response as! HTTPURLResponse
        guard httpResponse.statusCode == 200 else {
            let apiError = try decoder.decode(ApiError.self, from: data)
            throw apiError
        }
        let authResponse = try decoder.decode(AuthResponse.self, from: data)
        print(authResponse) //TODO: later change this to actually saving the User in VieModel, and JWTTOken to userDefaults.
        return authResponse
    }
    
    
    func validateToken(token: String) async throws -> MainUser {
        let url = URL(string: "http://localhost:8080/api/auth/validate")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        let (data, response) = try await URLSession.shared.data(for: request)
        let httpResponse = response as! HTTPURLResponse
        
        guard httpResponse.statusCode == 200 else {
            let apiError = try decoder.decode(ApiError.self, from: data)
            throw apiError
        }
        let mainUser = try decoder.decode(MainUser.self, from: data)
        return mainUser
    }
    
}

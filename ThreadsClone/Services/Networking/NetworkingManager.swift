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
    private let serverAddress = "http://localhost:8080"
    
    private init(){}
    
    func login(email: String, password: String) async throws -> AuthResponse {
        let url = URL(string: "\(serverAddress)/api/auth/login")!
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
        let url = URL(string: "\(serverAddress)/api/auth/signUp")!
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
        return authResponse
    }
    
    
    func validateToken(token: String) async throws -> MainUser {
        let url = URL(string: "\(serverAddress)/api/auth/validate")!
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


extension NetworkingManager {
    
    ///Private function that prepares URLRequest object. A reusable function to reduce boilerplate code repetition
    private func prepareURLRequest(
        for endpoint: String,
        jwtToken: String,
        httpMethod: String
    ) -> URLRequest {
        
        var url = URL(string: "\(serverAddress)/\(endpoint)")!
        var request = URLRequest(url: url)
        request.setValue("Bearer \(jwtToken)", forHTTPHeaderField: "Authorization")
        request.httpMethod = httpMethod
        return request
        
    }
    
    
    ///this function fetches all of the users of the app from the backend
    func fetchAllUsers(jwtToken: String, filter: String? = nil) async throws -> [SearchedUser] {
        var urlString = ""
        if let filter {
            urlString = "/api/allUsers?userName=\(filter)"
        }
        else {
            urlString = "/api/allUsers"
        }
        var request = prepareURLRequest(for: urlString, jwtToken: jwtToken, httpMethod: "GET")
        let (data, response) = try await URLSession.shared.data(for: request)
        let httpResponse = response as! HTTPURLResponse
        
        guard httpResponse.statusCode == 200 else {
            let apiError = try decoder.decode(ApiError.self, from: data)
            throw apiError
        }
        
        let users = try decoder.decode([SearchedUser].self, from: data)
        return users
    }
    
    
    ///fetch all threads from
    func fetchThreads(jwtToken: String) async throws -> [Thread] {
        var request = prepareURLRequest(for: "/api/threads", jwtToken: jwtToken, httpMethod: "GET")
        let (data, response) = try await URLSession.shared.data(for: request)
        let httpResponse = response as! HTTPURLResponse
        
        guard httpResponse.statusCode == 200 else {
            let apiError = try decoder.decode(ApiError.self, from: data)
            throw apiError
        }
    
        let threads = try decoder.decode([Thread].self, from: data)
        return threads
    }
    
    func postThread(jwtToken: String, thread: Thread) async throws -> Bool {
        var request = prepareURLRequest(for: "/api/threads", jwtToken: jwtToken, httpMethod: "POST")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try encoder.encode(thread)
        let (data, response) = try await URLSession.shared.data(for: request)
        let httpResponse = response as! HTTPURLResponse
        
        guard httpResponse.statusCode == 200 else {
            let apiError = try decoder.decode(ApiError.self, from: data)
            throw apiError
        }
        return true
    }
    
}

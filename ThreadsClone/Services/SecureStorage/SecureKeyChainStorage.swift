//
//  FileSystem.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 25/1/26.
//

import Foundation

struct KeyChainError: Error {
    var message: String
}


final class SecureKeyChainStorage {
    private let service = "com.Shakir.ThreadsClone"
    private let account = "jwt_token"
    
    static let shared = SecureKeyChainStorage()
    private init() {}
    
    private func writeTokenToKeyChain(token: String) throws {
        guard let tokenData = token.data(using: .utf8) else {
            print("❌ Failed to convert token to Data")
            return
        }
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrService as String: service,
                                    kSecAttrAccount as String: account,
                                    kSecValueData as String: tokenData]

        //delete the item if it is there: (An old, expired jwt token will eventually to be replaced with a newer one)
        SecItemDelete(query as CFDictionary)
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status == errSecSuccess else {
            let message = SecCopyErrorMessageString(status, nil) as String? ?? "error saving jwt token"
            
            throw KeyChainError(message: message)
        }
    }
    
    private func getJWTToken() throws -> String? {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                     kSecAttrService as String: service,
                     kSecAttrAccount as String: account,
                     kSecReturnData as String: true,
                     ]
        
        var tokenData: CFTypeRef?
        let status = unsafe SecItemCopyMatching(query as CFDictionary, &tokenData)
        if status == errSecSuccess {
            if let data = tokenData as? Data,
               let token = String(data: data, encoding: .utf8) {
                print("✅ Token retrieved from Keychain (decrypted)")
                return token  // ← Plain text JWT token
            }
            else {
                return nil
            }
        }
        else {
            let message = SecCopyErrorMessageString(status, nil) as String? ?? "error retrieving jwt token"
            throw KeyChainError(message: message)
        }
    }
    
    
    private func deleteTokenFromKeyChain() throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        if status == errSecSuccess {
            print("✅ Token deleted from Keychain")
        }
        else {
            throw KeyChainError(message: "error deleting jwt token")
        }
    }
    
    
    
    func saveToken(token: String) throws {
        try writeTokenToKeyChain(token: token)
    }
    
    func getToken() throws -> String? {
        return try getJWTToken()
    }
    
    func deleteToken() throws {
        try deleteTokenFromKeyChain()
    }
}

//
//  SearchUsersViewModel.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 20/12/25.
//

import Foundation
import SwiftUI

@Observable
final class SearchUsersViewModel {
    var userName = ""
    private let networkManager = NetworkingManager.shared
    
    var listOfAllUsers: [SearchedUser] = []
    
    func fetchAllUsers(jwtToken: String) async  {
        do {
            listOfAllUsers = try await networkManager.fetchAllUsers(jwtToken: jwtToken)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchUsers(by filter: String, jwtToken: String) async {
        do {
            listOfAllUsers = try await networkManager.fetchAllUsers(jwtToken: jwtToken, filter: filter)
        }
        catch {
            print(error.localizedDescription)
        }
    }
}

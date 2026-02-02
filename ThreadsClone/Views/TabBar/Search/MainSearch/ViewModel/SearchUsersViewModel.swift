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
    
    func toggleFollowStatus(searchedUser: SearchedUser, mainUser: MainUser, jwtToken: String) async {
        if let index = listOfAllUsers.firstIndex(where: {$0.id == searchedUser.id}) {
            let originialFollowStatus = listOfAllUsers[index].isFollowed
            let originalFollowersCount = listOfAllUsers[index].numberOfFollowers
            
            // toggle the isFollowed status so that UI can immediately update
            listOfAllUsers[index].isFollowed.toggle()
            let newFollowStatus = listOfAllUsers[index].isFollowed
            
            if listOfAllUsers[index].isFollowed {
                listOfAllUsers[index].numberOfFollowers += 1
            } else {
                listOfAllUsers[index].numberOfFollowers -= 1
            }
            
            do {
                let _ = try await networkManager.toggleFollowStatus(userId: searchedUser.id, jwtToken: jwtToken, shouldFollow: newFollowStatus)
                
            }
            catch {
                if let index = listOfAllUsers.firstIndex(where: { $0.id == searchedUser.id }) {
                    listOfAllUsers[index].isFollowed = originialFollowStatus
                    listOfAllUsers[index].numberOfFollowers = originalFollowersCount
                }
                print("Failed to toggle follow status: \(error.localizedDescription)")
            }
        }
    }
}

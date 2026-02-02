//
//  EditProfileVM.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 6/1/26.
//

import Foundation
import SwiftUI


@Observable
final class EditProfileVM {
    var fullName: String = ""
    var bio: String = ""
    var isPrivateProfile: Bool = false
    private let networkManager = NetworkingManager.shared
    var isUpdating = false
    
    func configure(with mainUser: MainUser) {
        self.fullName = mainUser.fullName
        self.bio = mainUser.bio
    }
    
    func updateProfile(mainAuthVM: MainAuthViewModel) async {
        isUpdating = true
        defer { isUpdating = false }
        
        do {
            try await networkManager.updateProfile(
                jwtToken: mainAuthVM.jwtToken,
                bio: bio
            )
            mainAuthVM.mainUser?.bio = bio
            
        }
        
        catch let error as ApiError{
            print(error.message)
        }
        catch {
            print("error in updateProfile api: \(error.localizedDescription)")
        }
    }
}

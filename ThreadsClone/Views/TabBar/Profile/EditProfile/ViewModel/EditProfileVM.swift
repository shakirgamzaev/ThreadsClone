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
    var name: String = ""
    var bio: String = ""
    var isPrivateProfile: Bool = false
    
    func configure(with mainUser: MainUser) {
        self.name = mainUser.fullName
        self.bio = mainUser.bio
    }
}

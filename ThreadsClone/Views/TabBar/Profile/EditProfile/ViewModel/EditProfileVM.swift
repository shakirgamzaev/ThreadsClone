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
    var link: String = ""
    var isPrivateProfile: Bool = false
}

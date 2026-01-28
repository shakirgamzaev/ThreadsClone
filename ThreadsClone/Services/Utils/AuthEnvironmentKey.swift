//
//  AuthEnvironmentKey.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 17/12/25.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var isLoggedIn: Binding<Bool> = .constant(false)
}

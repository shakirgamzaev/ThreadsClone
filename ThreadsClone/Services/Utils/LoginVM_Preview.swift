//
//  LoginVM_Preview.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 16/12/25.
//

import Foundation
import SwiftUI

struct LoginVM_Preview: PreviewModifier {
    static func makeSharedContext() async throws -> LoginViewModel {
        return LoginViewModel()
    }
    
    func body(
        content: Content,
        context: LoginViewModel
    ) -> some View {
        content
            .environment(context)
    }
}

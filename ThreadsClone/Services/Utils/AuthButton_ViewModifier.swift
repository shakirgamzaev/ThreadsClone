//
//  AuthButton_ViewModifier.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 17/12/25.
//

import Foundation
import SwiftUI


struct AuthButton_ViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundStyle(Color(uiColor: .systemBackground))
            .frame(maxWidth: .infinity)
            .background(.loginBtn, in: RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func authButtonStyle() -> some View {
        modifier(AuthButton_ViewModifier())
    }
}

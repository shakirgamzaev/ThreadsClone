//
//  LoginViewBottom.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 16/12/25.
//

import SwiftUI

struct LoginViewBottom: View {
    @Environment(\.isLoggedIn) private var isLoggedIn
    @Environment(LoginViewModel.self) private var loginVM
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 16) {
            Text("Forgot Password?")
                .bold()
            
            Button {
                //Login
//                withAnimation(.smooth(duration: 0.2)) {
//                    isLoggedIn.wrappedValue = true
//                }
                Task {
                    await loginVM.login()
                }
            } label: {
                Text("Login")
                    .authButtonStyle()
            }
            
        }
    }
}

#Preview {
    NavigationStack {
        LoginViewBottom()
    }
    .environment(LoginViewModel())
}

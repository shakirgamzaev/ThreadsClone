//
//  LoginViewBottom.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 16/12/25.
//

import SwiftUI

struct LoginViewBottom: View {
    @Environment(LoginViewModel.self) private var loginVM
    @Environment(MainAuthViewModel.self) private var mainAuthVM
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 16) {
            Text("Forgot Password?")
                .bold()
            
            Button {
                Task {
                    await loginVM.login(authVM: mainAuthVM)
                }
            } label: {
                Text("Login")
                    .authButtonStyle()
            }
            .disabled(mainAuthVM.isCheckingAuth)
            .overlay {
                if mainAuthVM.isCheckingAuth {
                    ProgressView()
                }
            }
            
            Text(loginVM.error)
                .foregroundStyle(.red)
        }
    }
}

#Preview(traits: .modifier(MainAuthVMPreview())) {
    NavigationStack {
        LoginViewBottom()
    }
    .environment(LoginViewModel())
}

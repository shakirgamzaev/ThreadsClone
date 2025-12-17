//
//  LoginViewBottom.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 16/12/25.
//

import SwiftUI

struct LoginViewBottom: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 16) {
            Text("Forgot Password?")
                .bold()
            
            Button {
                //Login
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
}

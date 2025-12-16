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
                    .padding()
                    .foregroundStyle(Color(uiColor: .systemBackground))
                    .frame(maxWidth: .infinity)
                    .background(.loginBtn, in: RoundedRectangle(cornerRadius: 10))
            }
            
        }
    }
}

#Preview {
    NavigationStack {
        LoginViewBottom()
    }
}

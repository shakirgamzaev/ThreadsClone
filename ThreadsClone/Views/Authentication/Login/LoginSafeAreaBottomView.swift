//
//  LoginSafeAreaBottomView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 17/12/25.
//

import SwiftUI

struct LoginSafeAreaBottomView: View {
    var body: some View {
        VStack(spacing: 15) {
            Rectangle()
                .foregroundStyle(Color(uiColor: .systemGray4))
                .frame(height: 2)
            
            NavigationLink {
                MainSignUpView()
            } label: {
                Text("Don't have an account? Sign up")
                    .foregroundStyle(.black)
            }

        }
    }
}

#Preview {
    LoginSafeAreaBottomView()
}

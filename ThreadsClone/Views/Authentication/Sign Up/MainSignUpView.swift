//
//  MainSignUpView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 17/12/25.
//

import SwiftUI

struct MainSignUpView: View {
    @State private var width: CGFloat = 0
    @State private var signUpVM = SignUpViewModel()
    
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                LogoIconView(width: width * 0.27)
                TextFieldsStackView()
                
                Button {
                    //Sign up
                } label: {
                    Text("Sign up")
                        .authButtonStyle()
                }

            }
            .frame(maxHeight: .infinity)
            .safeAreaInset(edge: .bottom) {
                SignUpBottomView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .onGeometryChange(for: CGFloat.self, of: { geo in
            geo.size.width
        }, action: { newValue in
            width = newValue
        })
        .navigationBarBackButtonHidden()
        .environment(signUpVM)
    }
}

#Preview {
    MainSignUpView()
}

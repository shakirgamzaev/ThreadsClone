//
//  ContainerView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 16/12/25.
//

import SwiftUI

struct ContainerView: View {
    let size: CGSize
    @Environment(LoginViewModel.self) private var loginVM: LoginViewModel
    
    var body: some View {
        @Bindable var loginVM = loginVM
        
        VStack(spacing: 18) {
            LogoIconView(width: size.width * 0.27)
            
            VStack {
                Group {
                    TextField("email", text: $loginVM.email, prompt: Text("Enter your email"))
                    SecureField("password", text: $loginVM.password, prompt: Text("Enter your password"))
                        
                }
                .textFieldBackground(cornerRadius: 10)
            }
            
            LoginViewBottom()
                .safeAreaPadding(.top, 10)
            
        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom, content: {
            LoginSafeAreaBottomView()
        })
        .padding()
    }
}

#Preview(traits: .modifier(LoginVM_Preview())) {
    @Previewable @State var size: CGSize = .zero
    
    NavigationStack {
        VStack {
            ContainerView(size: size)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onGeometryChange(for: CGSize.self, of: { geo in
            geo.size
        }, action: { newValue in
            size = newValue
        })
        
    }
    .environment(MainAuthViewModel())
}

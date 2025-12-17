//
//  TextFieldsStackView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 17/12/25.
//

import SwiftUI

struct TextFieldsStackView: View {
    @Environment(SignUpViewModel.self) private var signUpVM
    
    var body: some View {
        @Bindable var signUpVM = signUpVM
        VStack {
            Group {
                TextField("email", text: $signUpVM.email, prompt: Text("Enter your email"))
                SecureField("password", text: $signUpVM.password, prompt: Text("Enter your password"))
                TextField("fullName", text: $signUpVM.fullName, prompt: Text("Enter your full name"))
                TextField("user Name", text: $signUpVM.userName, prompt: Text("Enter your username"))
            }
            .textFieldBackground(cornerRadius: 10)
        }
    }
}

#Preview() {
    TextFieldsStackView()
        .environment(SignUpViewModel())
}

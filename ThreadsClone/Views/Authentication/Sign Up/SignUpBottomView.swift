//
//  SignUpBottomView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 17/12/25.
//

import SwiftUI

struct SignUpBottomView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 15) {
            Rectangle()
                .foregroundStyle(Color(uiColor: .systemGray4))
                .frame(height: 2)
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account? ")
                    Text("Sign in")
                        .bold()
                }
                .foregroundStyle(Color(uiColor: .label))
                
            }


        }
    }
}

#Preview {
    SignUpBottomView()
}

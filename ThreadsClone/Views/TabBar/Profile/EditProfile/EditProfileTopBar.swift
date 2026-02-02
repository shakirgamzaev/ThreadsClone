//
//  EditProfileTopBar.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 6/1/26.
//

import SwiftUI

struct EditProfileTopBar: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(EditProfileVM.self) private var editProfileVM
    @Environment(MainAuthViewModel.self) private var mainAuthVM
    
    var body: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Text("Cancel")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Edit Profile")
                .frame(maxWidth: .infinity)
                .bold()
                
            
            Button {
                //Update the profile and call backend to update
                Task {
                    await editProfileVM.updateProfile(mainAuthVM: mainAuthVM)
                    dismiss()
                }
            } label: {
                Text("Done")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .fontWeight(.semibold)
            .opacity(editProfileVM.isUpdating ? 0.4 : 1)
            .disabled(editProfileVM.isUpdating)

        }
        .foregroundStyle(.loginBtn)
        .padding(20)
        .padding(.vertical, 2)
        .background(Color(uiColor: .systemBackground))
    }
}

#Preview {
    EditProfileTopBar()
}

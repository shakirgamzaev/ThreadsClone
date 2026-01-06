//
//  EditProfileTopBar.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 6/1/26.
//

import SwiftUI

struct EditProfileTopBar: View {
    var body: some View {
        HStack {
            Button {
                //Cancel
            } label: {
                Text("Cancel")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Edit Profile")
                .frame(maxWidth: .infinity)
                .bold()
                
            
            Button {
                //Done updaitng profile info
            } label: {
                Text("Done")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .fontWeight(.semibold)

        }
        .foregroundStyle(.loginBtn)
        .padding()
        .background(Color(uiColor: .systemBackground))
    }
}

#Preview {
    EditProfileTopBar()
}

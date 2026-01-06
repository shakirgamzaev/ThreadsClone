//
//  EditProfile-EditSection.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 6/1/26.
//

import SwiftUI

struct EditProfile_EditSection: View {
    @Environment(EditProfileVM.self) private var editProfileViewModel
    let width: CGFloat
    
    var body: some View {
        @Bindable var editProfileVM = editProfileViewModel
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Name")
                        .bold()
                    TextField("name", text: $editProfileVM.name, prompt: Text("Enter your name"))
                }
                
                UserImageView(dataSource: .assetCatalog("userImg"), widthContainer: width, percentOfContainerWidth: 0.11)
            }
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Bio")
                    .bold()
                TextField("Bio", text: $editProfileVM.bio, prompt: Text("Enter your bio..."))
            }
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Bio")
                    .bold()
                TextField("Bio", text: $editProfileVM.link, prompt: Text("Add link"))
            }
            
            Divider()
            
            HStack {
                Text("Private profile")
                Toggle("private", isOn: $editProfileVM.isPrivateProfile)
            }
            .padding(.vertical, 5)
            
        }
    }
}

#Preview {
    EditProfile_EditSection(width: 404)
        .environment(EditProfileVM())
}

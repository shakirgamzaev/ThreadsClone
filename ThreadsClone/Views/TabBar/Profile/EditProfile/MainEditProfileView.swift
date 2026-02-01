//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 6/1/26.
//

import SwiftUI

struct MainEditProfileView: View {
    @State private var editprofileVM = EditProfileVM()
    @Environment(MainAuthViewModel.self) private var mainAuthVM
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                EditProfileTopBar()
                
                Spacer()
                
                //The actual form that has all of the user profile details.
                VStack {
                    EditProfile_EditSection(width: geo.size.width)
                        .padding()
                        .background(Color(uiColor: .systemBackground), in: RoundedRectangle(cornerRadius: 10))
                }
                .padding()
                
                Spacer()
            }
            .frame(maxHeight: .infinity)
            .background(Color(uiColor: .systemGray6))
            .environment(editprofileVM)
        }
        .onAppear {
            editprofileVM.configure(with: mainAuthVM.mainUser ?? mainUserPreviewModel)
        }
        
        
    }
}

#Preview(traits: .modifier(MainAuthVMPreview())) {
    NavigationStack {
        MainEditProfileView()
    }
}

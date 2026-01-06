//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 6/1/26.
//

import SwiftUI

struct MainEditProfileView: View {
    @State private var editprofileVM = EditProfileVM()
   
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                //The actual edit profile
                EditProfileTopBar()
                
                Spacer()
                
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
        
        
    }
}

#Preview {
    NavigationStack {
        MainEditProfileView()
    }
}

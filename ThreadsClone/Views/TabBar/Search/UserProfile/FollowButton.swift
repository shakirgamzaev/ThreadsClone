//
//  FollowButton.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 23/12/25.
//

import SwiftUI

struct FollowButton: View {
    let searchedUser: SearchedUser
    @Environment(SearchUsersViewModel.self) private var searchUsersVM
    @Environment(MainAuthViewModel.self) private var mainAuthVM
    
    var body: some View {
        Button {
            //Follow/unfollow
            Task {
                await searchUsersVM.toggleFollowStatus(
                    searchedUser: searchedUser,
                    mainUser: mainAuthVM.mainUser ?? mainUserPreviewModel,
                    jwtToken: mainAuthVM.jwtToken
                )
            }
        } label: {
            Text(searchedUser.isFollowed ? "Following" : "Follow")
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(searchedUser.isFollowed ? .primary : Color(uiColor: .systemBackground))
                .background {
                    if !searchedUser.isFollowed {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.loginBtn)
                    }
                    else {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(uiColor: .systemGray3), lineWidth: 3)
                    }
                }
            
        }
    }
}

#Preview(traits: .modifier(MainAuthVMPreview())) {
    FollowButton(searchedUser: searchedUserPreviewModel)
        .environment(SearchUsersViewModel())
}

//
//  FollowButton.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 23/12/25.
//

import SwiftUI

struct FollowButton: View {
    @Binding var isFollowing: Bool
    var body: some View {
        Button {
            //Follow/unfollow
            isFollowing.toggle()
        } label: {
            Text(isFollowing ? "Following" : "Follow")
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(isFollowing ? .primary : Color(uiColor: .systemBackground))
                .background {
                    if !isFollowing {
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

#Preview {
    FollowButton(isFollowing: .constant(false))
}

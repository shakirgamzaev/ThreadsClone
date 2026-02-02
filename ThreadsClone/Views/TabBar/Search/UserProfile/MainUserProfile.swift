//
//  UserProfile.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 23/12/25.
//

import SwiftUI

struct MainUserProfile: View {
    @State private var isFollowing = false
    @Namespace private var anim
    @State private var selectedFilter: ProfileThreadFilter = .threads
    let searchedUser: SearchedUser
    
    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            ZStack {
                VStack(spacing: 15) {
                    UserProfileTopHeader(
                        containerWidth: size.width,
                        searchedUser: searchedUser
                    )
                    
                    FollowButton(searchedUser: searchedUser)
                        .padding(.horizontal)

                    UserProfileOptions(
                        selectedFilter: $selectedFilter,
                        animId: anim
                    )
                    .padding(.horizontal)
                    .safeAreaPadding(.top, 15)
                    
                    //
                    ScrollView {
                        LazyVStack {
                            ForEach(0..<10) { _ in
                                MainFeedCellView(containerWidth: size.width, thread: PreviewThread)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

#Preview(traits: .modifier(MainAuthVMPreview())) {
    MainUserProfile(searchedUser: searchedUserPreviewModel)
        .environment(SearchUsersViewModel())
}

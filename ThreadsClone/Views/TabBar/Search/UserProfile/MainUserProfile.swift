//
//  UserProfile.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 23/12/25.
//

import SwiftUI

struct MainUserProfile: View {
    @Namespace private var anim
    @State private var selectedFilter: ProfileThreadFilter = .threads
    let searchedUser: SearchedUser
    @State private var userProfileVM = UserProfileViewModel()
    @Environment(MainAuthViewModel.self) private var mainAuthVM
    
    
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
                    ZStack {
                        if (selectedFilter == .threads) {
                            UserProfileListOfThreadsView(
                                containerWidth: size.width,
                                thread: PreviewThread
                            )
                            .transition(.asymmetric(
                                insertion: .move(edge: .leading),
                                removal: .move(edge: .leading)
                            ))
                        }
                        
                        //List of replies
                        else {
                            ScrollView {
                                Rectangle()
                                    .fill(.gray.opacity(0.3))
                                    .frame(height: 700)
                            }
                            .transition(.asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .slide
                            ))
                            
                        }
                    }
                }
                .animation(.smooth(duration: 0.3), value: selectedFilter)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .task {
                await userProfileVM.fetchThreadsOfThisUser(userId: searchedUser.id, jwtToken: mainAuthVM.jwtToken)
            }
            .environment(userProfileVM)
        }
    }
}

#Preview(traits: .modifier(MainAuthVMPreview())) {
    MainUserProfile(searchedUser: searchedUserPreviewModel)
        .environment(SearchUsersViewModel())
}

//
//  UserCellSearchView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 20/12/25.
//

import SwiftUI

struct UserCellSearchView: View {
    @State private var containerWidth: CGFloat = 0
    let searchedUser: SearchedUser
    let mainSearchUsersVM: SearchUsersViewModel
    @Environment(MainAuthViewModel.self) private var mainAuthVM
    
    var body: some View {
        HStack {
            NavigationLink {
                MainUserProfile()
            } label: {
                HStack {
                    UserImageView(
                        dataSource: .assetCatalog("userImg"),
                        widthContainer: containerWidth,
                        percentOfContainerWidth: 0.1
                    )
                    
                    VStack(alignment: .leading) {
                        Text(searchedUser.userName)
                            .bold()
                        Text(searchedUser.fullName)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .foregroundStyle(.loginBtn)
            }

            
            
            Button {
                //Toggle follow and unfollow
                Task {
                    await mainSearchUsersVM.toggleFollowStatus(
                        searchedUser: searchedUser,
                        mainUser: mainAuthVM.mainUser ?? mainUserPreviewModel
                    )
                }
            } label: {
                Text(searchedUser.isFollowed ? "Following" : "Follow")
                    .bold()
                    .padding(8)
                    .frame(width: containerWidth * 0.27)
                    .background {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color(uiColor: .systemGray3), lineWidth: 2)
                    }
                    .foregroundStyle(.loginBtn)
            }

            
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding()
        .onGeometryChange(for: CGFloat.self) { geo in
            geo.size.width
        } action: { newValue in
            containerWidth = newValue
        }

    }
}



#Preview {
    UserCellSearchView(searchedUser: searchedUserPreviewModel, mainSearchUsersVM: SearchUsersViewModel())
}

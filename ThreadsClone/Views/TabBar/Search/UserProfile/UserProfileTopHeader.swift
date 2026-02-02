//
//  UserProfileTopHeader.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 23/12/25.
//

import SwiftUI

struct UserProfileTopHeader: View {
    let containerWidth: CGFloat
    let searchedUser: SearchedUser
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading) {
                    Text(searchedUser.fullName)
                        .font(.title2)
                        .bold()
                    Text(searchedUser.userName)
                }
                
                Text(searchedUser.bio)
                Text("\(searchedUser.numberOfFollowers) followers")
                    .foregroundStyle(.secondary)
                
            }
            
            Spacer()
            
            UserImageView(
                dataSource: .assetCatalog("userImg"),
                widthContainer: containerWidth,
                percentOfContainerWidth: 0.14
            )
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var width: CGFloat = 0
    
    UserProfileTopHeader(
        containerWidth: 404,
        searchedUser: searchedUserPreviewModel
    )
        .frame(maxWidth: .infinity)
        .onGeometryChange(for: CGFloat.self) { geo in
            geo.size.width
        } action: { newValue in
            width = newValue
        }

}

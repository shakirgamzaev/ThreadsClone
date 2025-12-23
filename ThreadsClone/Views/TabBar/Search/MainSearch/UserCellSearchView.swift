//
//  UserCellSearchView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 20/12/25.
//

import SwiftUI

struct UserCellSearchView: View {
    @State private var containerWidth: CGFloat = 0
    
    var body: some View {
        HStack {
            NavigationLink {
                UserProfile()
            } label: {
                HStack {
                    UserImageView(
                        dataSource: .assetCatalog("userImg"),
                        widthContainer: containerWidth,
                        percentOfContainerWidth: 0.1
                    )
                    
                    VStack(alignment: .leading) {
                        Text("maxverstappen1")
                            .bold()
                        Text("Max Verstappen")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .foregroundStyle(.loginBtn)
            }

            
            
            Button {
                //Toggle follow and unfollow
            } label: {
                Text("Follow")
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
    UserCellSearchView()
}

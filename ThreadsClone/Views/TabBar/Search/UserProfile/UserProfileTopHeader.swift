//
//  UserProfileTopHeader.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 23/12/25.
//

import SwiftUI

struct UserProfileTopHeader: View {
    let containerWidth: CGFloat
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading) {
                    Text("Charles Leclerc")
                        .font(.title2)
                        .bold()
                    Text("charles_leclerc")
                }
                
                Text("Formula 1 driver for Scuderia Ferrari")
                
                Text("2 Followers")
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
    
    UserProfileTopHeader(containerWidth: 404)
        .frame(maxWidth: .infinity)
        .onGeometryChange(for: CGFloat.self) { geo in
            geo.size.width
        } action: { newValue in
            width = newValue
        }

}

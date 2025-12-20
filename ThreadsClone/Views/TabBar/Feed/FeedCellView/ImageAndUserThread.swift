//
//  ImageAndUserThread.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 18/12/25.
//

import SwiftUI

struct ImageAndUserThread: View {
    let containerWidth: CGFloat
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            UserImageView(
                dataSource: .assetCatalog("userImg"),
                widthContainer: containerWidth,
                percentOfContainerWidth: 0.11
            )
            
            VStack(alignment: .leading, spacing: 6) {
                Text("max_verstappen")
                    .bold()
                Text("Monaco GP is an amazing GP and i am so grateful to you guys. It is just ")
                FeedCellButtons()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ImageAndUserThread(containerWidth: 404)
}

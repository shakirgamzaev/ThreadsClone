//
//  ImageAndUserThread.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 18/12/25.
//

import SwiftUI

struct ImageAndUserThread: View {
    let containerWidth: CGFloat
    let thread: Thread
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            UserImageView(
                dataSource: .assetCatalog("userImg"),
                widthContainer: containerWidth,
                percentOfContainerWidth: 0.11
            )
            
            VStack(alignment: .leading, spacing: 6) {
                Text(thread.userName)
                    .bold()
                Text(thread.content)
                FeedCellButtons()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ImageAndUserThread(containerWidth: 404, thread: PreviewThread)
}

//
//  FeedCellView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 18/12/25.
//

import SwiftUI

struct MainFeedCellView: View {
    let containerWidth: CGFloat
    let thread: Thread
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                ImageAndUserThread(
                    containerWidth: containerWidth,
                    thread: thread
                )
                
                HStack {
                    Text(postDate)
                        .foregroundStyle(.secondary)
                    Image(systemName: "ellipsis")
                }
                .safeAreaPadding(.leading, 4)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

extension MainFeedCellView {
    var postDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: thread.postDate)
    }
}

#Preview {
    MainFeedCellView(containerWidth: 404, thread: PreviewThread)
}

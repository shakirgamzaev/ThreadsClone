//
//  FeedCellView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 18/12/25.
//

import SwiftUI

struct MainFeedCellView: View {
    let containerWidth: CGFloat
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                ImageAndUserThread(containerWidth: containerWidth)
                
                HStack {
                    Text("10m")
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

#Preview {
    MainFeedCellView(containerWidth: 404)
}

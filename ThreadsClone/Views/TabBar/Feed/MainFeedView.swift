//
//  MainFeedView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 17/12/25.
//

import SwiftUI

struct MainFeedView: View {
    @State private var containerWidth: CGFloat = 0
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<100) { _ in
                    MainFeedCellView(containerWidth: containerWidth)
                }
            }
        }
        .scrollIndicators(.hidden)
        .safeAreaInset(edge: .top, content: {
            FeedViewTopBar()
        })
        .mask {
            Rectangle()
                .ignoresSafeArea(edges: [.bottom, .top])
        }
        .onGeometryChange(for: CGFloat.self, of: { geo in
            geo.size.width
        }, action: { newValue in
            containerWidth = newValue
        })
    }
}

#Preview {
    MainFeedView()
}

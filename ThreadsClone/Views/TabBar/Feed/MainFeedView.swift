//
//  MainFeedView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 17/12/25.
//

import SwiftUI

struct MainFeedView: View {
    @State private var containerWidth: CGFloat = 0
    @State private var didRefresh: Bool = false
    @State private var mainFeedVM = MainFeedViewModel()
    @Environment(MainAuthViewModel.self) private var mainAuthVM
    
    var body: some View {
        Group {
            if mainFeedVM.isFetchingThreads {
                VStack {
                    ProgressView()
                        .scaleEffect(2)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.thickMaterial)
            }
            else {
                ScrollView {
                    LazyVStack {
                        ForEach(mainFeedVM.threads) { _ in
                            MainFeedCellView(containerWidth: containerWidth)
                        }
                    }
                }
                .refreshable {
                    didRefresh = true
                    try? await Task.sleep(for: .seconds(0.1))
                    didRefresh = false
                }
                .scrollIndicators(.hidden)
                .safeAreaInset(edge: .top, content: {
                    FeedViewTopBar(didRefresh: didRefresh)
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
        .task {
            await mainFeedVM.fetchThreads(jwtToken: mainAuthVM.jwtToken)
        }
    }
}

#Preview(traits: .modifier(MainAuthVMPreview())) {
    MainFeedView()
}

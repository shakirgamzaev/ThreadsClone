//
//  UserProfileListOfThreadsView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 7/2/26.
//

import SwiftUI

struct UserProfileListOfThreadsView: View {
    let containerWidth: CGFloat
    let thread: Thread
    @State private var widthOfFeedCellView: CGFloat = 0
    @Environment(UserProfileViewModel.self) private var userProfileVM: UserProfileViewModel
    
    var body: some View {
        if userProfileVM.isFetching {
            ProgressView()
                .scaleEffect(3)
        }
        else {
            if let errorMessage = userProfileVM.errorMessage {
                Text(errorMessage)
                    .font(.title3)
                    .foregroundStyle(.red)
            }
            else {
                ScrollView {
                    LazyVStack {
                        ForEach(userProfileVM.listOfThreads) { thread in
                            VStack {
                                MainFeedCellView(
                                    containerWidth: containerWidth,
                                    thread: thread
                                )
                                Rectangle()
                                    .fill(.secondary)
                                    .frame(height: 1)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    GeometryReader { geo in
        UserProfileListOfThreadsView(
            containerWidth: geo.size.width,
            thread: PreviewThread
        )
    }
    .environment(UserProfileViewModel())
}

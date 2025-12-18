//
//  FeedCellButtons.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 18/12/25.
//

import SwiftUI

struct FeedCellButtons: View {
    var body: some View {
        HStack(spacing: 20) {
            Group {
                Button {
                    //Like
                } label: {
                    Image(systemName: "heart")
                }
                
                Button {
                    //Comment
                } label: {
                    Image(systemName: "bubble.left")
                }

                Button {
                    //Send
                } label: {
                    Image(systemName: "paperplane")
                }
            }
            .foregroundStyle(.loginBtn)
            
        }
        .safeAreaPadding(.top, 10)
    }
}



#Preview {
    FeedCellButtons()
}

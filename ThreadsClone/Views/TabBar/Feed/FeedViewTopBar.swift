//
//  FeedViewTopBar.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 18/12/25.
//

import SwiftUI

struct FeedViewTopBar: View {
    var body: some View {
        HStack {
            Text("Threads")
                .font(.title3)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.thickMaterial)
    }
}

#Preview {
    FeedViewTopBar()
}

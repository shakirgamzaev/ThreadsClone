//
//  FeedViewTopBar.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 18/12/25.
//

import SwiftUI

struct FeedViewTopBar: View {
    let didRefresh: Bool
    @State private var rotationAngle: Double = 0
    
    var body: some View {
        HStack {
            Image(systemName: "arrow.clockwise")
                .opacity(0)
            Spacer()
            Text("Threads")
            
            Spacer()
            Image(systemName: "arrow.clockwise")
                .rotationEffect(.degrees(rotationAngle))
                
        }
        .font(.title3)
        .padding()
        .frame(maxWidth: .infinity)
        .background(.thickMaterial)
        .onChange(of: didRefresh) { oldValue, newValue in
            if newValue {
                withAnimation(.smooth(duration: 0.5)) {
                    rotationAngle = 360
                }
            }
            else {
                withAnimation(.none) {
                    rotationAngle = 0
                }
            }
        }
    }
}

#Preview {
    FeedViewTopBar(didRefresh: false)
}

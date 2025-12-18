//
//  MainTabView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 17/12/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selection: Int = 0
    @Environment(\.isLoggedIn) private var isLoggedIn
    
    var body: some View {
        TabView(selection: $selection) {
            Tab("", systemImage: "house", value: 0) {
                MainFeedView()
            }
            Tab("", systemImage: "magnifyingglass", value: 1) {
                Text("Explore")
            }
            Tab("", systemImage: "plus", value: 2) {
                Text("Upload Thread")
            }
            Tab("", systemImage: "suit.heart", value: 3) {
                Text("Activity")
            }
            Tab("", systemImage: "person", value: 4) {
                Text("Profile")
            }
        }
        
    }
}

#Preview {
    MainTabView()
}

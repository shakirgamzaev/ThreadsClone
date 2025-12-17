//
//  MainTabView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 17/12/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Tab("", systemImage: "house", value: 0) {
                Text("Home page")
            }
            Tab("", systemImage: "magnifyingglass", value: 1) {
                Text("Explore")
            }
            Tab("", systemImage: "plus", value: 2) {
                Text("Explore")
            }
        }
        .onChange(of: selection) { oldValue, newValue in
            print("Selected tab: \(newValue)")
        }
    }
}

#Preview {
    MainTabView()
}

//
//  MainTabView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 17/12/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selection: Int = 0
    @Environment(MainAuthViewModel.self) private var mainAuthVM
    @State private var showUploadView = false
    
    var body: some View {
        TabView(selection: $selection) {
            Tab("", systemImage: "house", value: 0) {
                NavigationStack {
                    MainFeedView()
                }
            }
            Tab("", systemImage: "magnifyingglass", value: 1) {
                NavigationStack {
                    MainSearchUsersView()
                }
            }
            Tab("", systemImage: "plus", value: 2) {
                NavigationStack {
                    Text("Upload Thread")
                }
            }
            Tab("", systemImage: "suit.heart", value: 3) {
                NavigationStack {
                    Text("Activity")
                }
            }
            Tab("", systemImage: "person", value: 4) {
                NavigationStack {
                    MainProfileView()
                }
            }
        }
        .sheet(isPresented: $showUploadView, onDismiss: {
            selection = 0
        }, content: {
            MainUploadTweet()
        })
        .onChange(of: selection) { oldValue, newValue in
            if selection == 2 {
                showUploadView = true
            }
            
        }
        
    }
}

#Preview(traits: .modifier(MainAuthVMPreview())) {
    MainTabView()
}

//
//  MainSearchUsersView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 20/12/25.
//

import SwiftUI

struct MainSearchUsersView: View {
    @State private var searchUsersVM = SearchUsersViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<50) { _ in
                    VStack {
                        UserCellSearchView()
                        Divider()
                    }
                }
            }
        }
        .contentMargins(.top, 10)
        .contentMargins(.horizontal, 14)
        .navigationTitle(Text("Search"))
        .searchable(text: $searchUsersVM.userName, placement: .navigationBarDrawer, prompt: "Search User")
        .scrollIndicators(.hidden)
    }
}

#Preview {
    NavigationStack {
        MainSearchUsersView()
    }
}

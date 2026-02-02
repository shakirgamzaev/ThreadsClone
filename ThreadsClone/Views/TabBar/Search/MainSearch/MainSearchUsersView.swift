//
//  MainSearchUsersView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 20/12/25.
//

import SwiftUI

struct MainSearchUsersView: View {
    @State private var searchUsersVM = SearchUsersViewModel()
    @Environment(MainAuthViewModel.self) private var mainAuthVM
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(searchUsersVM.listOfAllUsers) { searchedUser in
                    VStack {
                        UserCellSearchView(
                            searchedUser: searchedUser
                        )
                        Divider()
                    }
                }
            }
        }
        .environment(searchUsersVM)
        .contentMargins(.top, 10)
        .contentMargins(.horizontal, 14)
        .navigationTitle(Text("Search"))
        .searchable(text: $searchUsersVM.userName, placement: .navigationBarDrawer, prompt: "Search User")
        .scrollIndicators(.hidden)
        .onChange(of: searchUsersVM.userName, { oldValue, newValue in
            Task {
                await searchUsersVM.fetchUsers(by: newValue, jwtToken: mainAuthVM.jwtToken)
            }
        })
        .task {
            Task {
                await searchUsersVM.fetchAllUsers(jwtToken: mainAuthVM.jwtToken)
            }
        }
    }
}

#Preview(traits: . modifier(MainAuthVMPreview())) {
    NavigationStack {
        MainSearchUsersView()
    }
}

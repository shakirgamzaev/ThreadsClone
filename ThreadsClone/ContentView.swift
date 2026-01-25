//
//  ContentView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 16/12/25.
//

import SwiftUI

struct ContentView: View {
    //Controls the authentication state. Later change it to a view model that will control whether a user is logged in or not.
    @State private var mainAuthVM = MainAuthViewModel()
    
    var body: some View {
        ZStack {
            if mainAuthVM.isValidatingUserSession {
                ValidatingUserView()
            }
            else {
                if mainAuthVM.isLoggedIn {
                    MainTabView()
                        .transition(.move(edge: .trailing))
                        .zIndex(1)
                }
                else {
                   MainLoginView()
                        .transition(.move(edge: .leading))
                        .zIndex(0)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .environment(mainAuthVM)
    }
}

#Preview {
    NavigationStack {
        ContentView()
            
    }
}

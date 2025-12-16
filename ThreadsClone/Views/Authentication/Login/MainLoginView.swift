//
//  MainLoginView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 16/12/25.
//

import SwiftUI

struct MainLoginView: View {
    @State private var loginVM = LoginViewModel()
    
    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            ZStack {
                ContainerView(size: size)
                
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
            )
        }
        .environment(loginVM)
    }
}

#Preview {
    NavigationStack {
        MainLoginView()
    }
}

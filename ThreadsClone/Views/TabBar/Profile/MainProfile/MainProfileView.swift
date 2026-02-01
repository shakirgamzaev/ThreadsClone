//
//  MainProfileView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 6/1/26.
//

import SwiftUI

struct MainProfileView: View {
    @State private var presentEditPRofile = false
    
    
    var body: some View {
        Button {
            presentEditPRofile = true
        } label: {
            Text("Edit profile")
        }
        .sheet(isPresented: $presentEditPRofile) {
            MainEditProfileView()
        }
    }
}

#Preview(traits: .modifier(MainAuthVMPreview())) {
    MainProfileView()
}

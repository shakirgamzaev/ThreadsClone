//
//  LogoView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 16/12/25.
//

import SwiftUI

struct LogoIconView: View {
    let width: CGFloat
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        Image(colorScheme == .dark ? .logoDark : .logoLight)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: width)
    }
}

#Preview {
    LogoIconView(width: 110)
}

//
//  LogoView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 16/12/25.
//

import SwiftUI

struct LogoIconView: View {
    let width: CGFloat
    var body: some View {
        Image(.logo)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: width)
    }
}

#Preview {
    LogoIconView(width: 110)
}

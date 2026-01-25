//
//  ValidatingUserView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 25/1/26.
//

import SwiftUI

struct ValidatingUserView: View {
    var body: some View {
        VStack {
            ProgressView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.thickMaterial)
    }
}

#Preview {
    ValidatingUserView()
}

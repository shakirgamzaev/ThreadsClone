//
//  TextField_ViewModifier.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 16/12/25.
//

import Foundation
import SwiftUI

struct TextField_ViewModifier: ViewModifier {
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(uiColor: .systemGray6), in: RoundedRectangle(cornerRadius: cornerRadius))
        
    }
}

extension View {
    func textFieldBackground(cornerRadius: CGFloat) -> some View {
        return modifier(
            TextField_ViewModifier(cornerRadius: cornerRadius)
        )
    }
        
}

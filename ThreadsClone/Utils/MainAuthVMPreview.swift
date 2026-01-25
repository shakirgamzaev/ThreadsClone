//
//  MainAuthVMPreview.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 25/1/26.
//

import Foundation
import SwiftUI


struct MainAuthVMPreview: PreviewModifier {
    static func makeSharedContext() async throws -> MainAuthViewModel {
        return MainAuthViewModel()
    }
    
    func body(
        content: Content,
        context: MainAuthViewModel
    ) -> some View {
        content
            .environment(context)
    }
}

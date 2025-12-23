//
//  UserProfileOptions.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 23/12/25.
//

import SwiftUI

struct UserProfileOptions: View {
    @Binding var selectedFilter: ProfileThreadFilter
    let animId: Namespace.ID
    
    var body: some View {
        HStack(alignment: .top) {
            ForEach(ProfileThreadFilter.allCases) { filter in
                VStack {
                    Text(filter.text)
                        .bold(selectedFilter == filter)
                    if selectedFilter == filter {
                        Capsule()
                            .frame(height: 2)
                            .matchedGeometryEffect(id: "animId", in: animId)
                    }
                }
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.smooth(duration: 0.25)) {
                        selectedFilter = filter
                    }
                }
            }
        }
    }
}

#Preview {
    UserProfileOptions(
        selectedFilter: .constant(
            .threads
        ),
        animId: Namespace().wrappedValue
    )
}

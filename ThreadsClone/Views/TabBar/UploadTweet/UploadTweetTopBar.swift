//
//  UploadTweetTopBar.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 12/1/26.
//

import SwiftUI

struct UploadTweetTopBar: View {
    @Environment(\.dismiss) private var dismiss
    let tweetText: String
    
    var body: some View {
        HStack {
            Button {
                //dismiss screen
                dismiss()
            } label: {
                Text("Cancel")
            }

            Spacer()
            
            Text("New Thread")
                .bold()
                .font(.title3)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Post")
                    .fontWeight(.semibold)
                    .opacity(tweetText.isEmpty ? 0.5 : 1.0)
            }
            .disabled(tweetText.isEmpty)

        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    UploadTweetTopBar(tweetText: "")
}

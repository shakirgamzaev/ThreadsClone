//
//  UploadTweetTopBar.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 12/1/26.
//

import SwiftUI

struct UploadTweetTopBar: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(MainAuthViewModel.self) private var mainAuthVM
    let uploadThreadVM: UploadThreadViewModel
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
                //TODO: upload new thread
                Task {
                    await uploadThreadVM.uploadThread(
                        jwtToken: mainAuthVM.jwtToken,
                        mainUser: mainAuthVM.mainUser ?? mainUserPreviewModel
                    )
                    dismiss()
                }
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

#Preview(traits: .modifier(MainAuthVMPreview())) {
    UploadTweetTopBar(
        uploadThreadVM: UploadThreadViewModel(),
        tweetText: ""
    )
}

//
//  MainUploadTweet.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 12/1/26.
//

import SwiftUI

struct MainUploadTweet: View {
    @State private var uploadTweetVM = UploadThreadViewModel()
    @State private var width = CGFloat.zero
    @Environment(MainAuthViewModel.self) private var mainAuthVM
    
    var body: some View {
        VStack {
            UploadTweetTopBar(
                uploadThreadVM: uploadTweetVM,
                tweetText: uploadTweetVM.threadContent
            )
                .padding(.top, 10)
            
            HStack(alignment: .top) {
                UserImageView(dataSource: .assetCatalog("userImg"), widthContainer: width, percentOfContainerWidth: 0.10)
                VStack(alignment: .leading, spacing: 3) {
                    Text("maxverstappen1")
                        .bold()
                    TextField(
                        "",
                        text: $uploadTweetVM.threadContent,
                        prompt: Text("Start a thread...")
                    )
                }
                Spacer()
                
                if !uploadTweetVM.threadContent.isEmpty {
                    Button {
                        uploadTweetVM.threadContent = ""
                    } label: {
                        Image(systemName: "xmark")
                            .fontWeight(.semibold)
                            .font(.title3)
                    }
                    .foregroundStyle(.primary)
                }

            }
            .safeAreaPadding(.top, 20)
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
        .onGeometryChange(for: CGFloat.self) { geo in
            geo.size.width
        } action: { newValue in
            width = newValue
        }
        
    }
}

#Preview(traits: .modifier(MainAuthVMPreview())){
    MainUploadTweet()
}

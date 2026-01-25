//
//  MainUploadTweet.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 12/1/26.
//

import SwiftUI

struct MainUploadTweet: View {
    @State private var tweetText = ""
    @State private var width = CGFloat.zero
    
    var body: some View {
        VStack {
            UploadTweetTopBar(tweetText: tweetText)
                .padding(.top, 10)
            
            HStack(alignment: .top) {
                UserImageView(dataSource: .assetCatalog("userImg"), widthContainer: width, percentOfContainerWidth: 0.10)
                VStack(alignment: .leading, spacing: 3) {
                    Text("maxverstappen1")
                        .bold()
                    TextField("", text: $tweetText, prompt: Text("Start a thread..."))
                }
                Spacer()
                
                if !tweetText.isEmpty {
                    Button {
                        tweetText = ""
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

#Preview {
    MainUploadTweet()
}

//
//  UserImageView.swift
//  ThreadsClone
//
//  Created by shakir Gamzaev on 18/12/25.
//

import SwiftUI

struct UserImageView: View {
    let dataSource: ImageDataSource
    let widthContainer: CGFloat
    let percentOfContainerWidth: CGFloat
    
    var body: some View {
        Group {
            switch dataSource {
            case .data(let data):
                if let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: widthContainer * percentOfContainerWidth, height: widthContainer * percentOfContainerWidth)
                        .clipShape(Circle())
                        
                }
                else {
                    Circle()
                        .frame(width: 50, height: 50)
                }
            case .assetCatalog(let imageName):
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: widthContainer * percentOfContainerWidth, height: widthContainer * percentOfContainerWidth)
                    .clipShape(Circle())
            }
        }
    }
}

///Enum that specifies the source of the image
///
///case data: image is created from raw Data struct, which is just an array of bytes
///case assetCatalog: image can be created by just supplying its name, how it is named in the Assets folder
enum ImageDataSource {
    case data(Data)
    case assetCatalog(String)
}

#Preview("assetCatalog") {
    @Previewable @State var containerWidth: CGFloat = 0
    
    UserImageView(
        dataSource: .assetCatalog("userImg"),
        widthContainer: containerWidth,
        percentOfContainerWidth: 0.14
    )
        .frame(maxWidth: .infinity, maxHeight: 300)
        .onGeometryChange(for: CGFloat.self) { geo in
            geo.size.width
        } action: { newValue in
            containerWidth = newValue
        }

}

#Preview("data") {
    @Previewable @State var containerWidth: CGFloat = 0
    let image = UIImage(named: "userImg")
    let data = image!.jpegData(compressionQuality: 0.7)
    
    UserImageView(
        dataSource: .data(data!),
        widthContainer: containerWidth,
        percentOfContainerWidth: 0.14
    )
        .frame(maxWidth: .infinity, maxHeight: 300)
        .onGeometryChange(for: CGFloat.self) { geo in
            geo.size.width
        } action: { newValue in
            containerWidth = newValue
        }

}



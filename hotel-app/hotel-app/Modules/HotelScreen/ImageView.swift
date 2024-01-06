//
//  ImageView.swift
//  hotel-app
//
//  Created by Evelina on 03.01.2024.
//

import SwiftUI

struct ImageView: View {
    @StateObject var viewModel: ImageViewModel
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if viewModel.isLoading {
                ZStack {
                    Asset.whiteImage.swiftUIImage
                        .resizable()
                        .scaledToFit()
                    ProgressView()
                }
            } else {
                ZStack {
                    Asset.whiteImage.swiftUIImage
                        .resizable()
                        .scaledToFit()
                    Image(systemName: "questionmark")
                }
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(viewModel: ImageViewModel(imageURL: "", imageService: ImageService(), imageCacheManager: ImageCacheManager()))
    }
}

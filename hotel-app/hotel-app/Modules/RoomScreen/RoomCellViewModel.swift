//
//  RoomCellViewModel.swift
//  hotel-app
//
//  Created by Evelina on 03.01.2024.
//

import Foundation

final class RoomCellViewModel: ObservableObject {
    @Published var images: [ImageView] = []
    var imageURLs: [String] = []
    private let imageService: ImageServiceProtocol
    private let imageCacheManager: ImageCacheManagerProtocol
    
    init(imageURLs: [String], imageService: ImageServiceProtocol, imageCacheManager: ImageCacheManagerProtocol) {
        self.imageURLs = imageURLs
        self.imageService = imageService
        self.imageCacheManager = imageCacheManager
        
        makeImage(urls: imageURLs)
    }
    
    private func makeImage(urls: [String]) {
        urls.forEach { url in
            self.images.append(ImageView(viewModel: ImageViewModel(imageURL: url, imageService: self.imageService, imageCacheManager: self.imageCacheManager)))
        }
    }
}

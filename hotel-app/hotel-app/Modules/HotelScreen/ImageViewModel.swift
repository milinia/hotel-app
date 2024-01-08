//
//  ImageViewModel.swift
//  hotel-app
//
//  Created by Evelina on 03.01.2024.
//

import SwiftUI
import Combine

protocol ImageViewModelProtocol {
    func fetchImage()
}

final class ImageViewModel: ObservableObject, ImageViewModelProtocol {
    @Published var image: Image? = nil
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    private var imageURL: String
    private let imageService: ImageServiceProtocol
    private let imageCacheManager: ImageCacheManagerProtocol
    private var disposables = Set<AnyCancellable>()
    
    init(imageURL: String, imageService: ImageServiceProtocol, imageCacheManager: ImageCacheManagerProtocol) {
        self.imageURL = imageURL
        self.imageService = imageService
        self.imageCacheManager = imageCacheManager
        self.isLoading = true
        
        fetchImage()
    }
    
    func fetchImage() {
        if let image = imageCacheManager.getImage(forKey: imageURL) {
            self.image = Image(uiImage: UIImage(data: image) ?? UIImage())
        } else {
            imageService.fetchImage(stringURL: imageURL)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] res in
                    self?.isLoading = false
                    switch res {
                    case .failure(_): self?.isError = true
                    case .finished: break
                    }
                } receiveValue: { [weak self] image in
                    self?.image = Image(uiImage: UIImage(data: image) ?? UIImage())
                    self?.imageCacheManager.setImage(object: image, forKey: self?.imageURL ?? "")
                }
                .store(in: &disposables)
        }
    }
}

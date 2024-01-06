//
//  HotelViewModel.swift
//  hotel-app
//
//  Created by Evelina on 25.12.2023.
//

import Combine
import SwiftUI
import Foundation

protocol HotelViewModelProtocol: ObservableObject, Identifiable {
    func fetchHotel()
}

final class HotelViewModel: HotelViewModelProtocol, ObservableObject {
    @Published var hotel: HotelData?
    @Published var images: [ImageView] = []
    
    private let requestAPI: RequestAPIManagerProtocol
    private let imageService: ImageServiceProtocol
    private let imageCacheManager: ImageCacheManagerProtocol
    private var disposables = Set<AnyCancellable>()
    
    init(requestAPI: RequestAPIManagerProtocol, imageService: ImageServiceProtocol, imageCacheManager: ImageCacheManagerProtocol) {
        self.requestAPI = requestAPI
        self.imageService = imageService
        self.imageCacheManager = imageCacheManager
    }
    
    func fetchHotel() {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let url = URL(string: requestAPI.getHotelsRequest()) else {return}
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: HotelData.self, decoder: jsonDecoder)
            .sink { result in
                
            } receiveValue: { [weak self] hotelData in
                self?.hotel = hotelData
                self?.makeImage(urls: hotelData.imageUrls)
            }
            .store(in: &disposables)
    }
    
    private func makeImage(urls: [String]) {
        urls.forEach { url in
            self.images.append(ImageView(viewModel: ImageViewModel(imageURL: url, imageService: self.imageService, imageCacheManager: self.imageCacheManager)))
        }
    }
}

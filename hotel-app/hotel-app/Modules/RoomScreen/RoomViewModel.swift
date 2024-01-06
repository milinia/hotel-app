//
//  RoomViewModel.swift
//  hotel-app
//
//  Created by Evelina on 25.12.2023.
//

import Combine
import SwiftUI

protocol RoomViewModelProtocol: ObservableObject, Identifiable {
    func fetchRooms()
}

final class RoomViewModel: RoomViewModelProtocol, ObservableObject {
    @Published var rooms: [RoomData] = []
    @Published var images: [ImageView] = []
    
    private let requestAPI: RequestAPIManagerProtocol
    private var disposables = Set<AnyCancellable>()
    let imageService: ImageServiceProtocol
    let imageCacheManager: ImageCacheManagerProtocol
    let hotelName: String
    
    init(requestAPI: RequestAPIManagerProtocol, hotelName: String, imageService: ImageServiceProtocol, imageCacheManager: ImageCacheManagerProtocol) {
        self.requestAPI = requestAPI
        self.hotelName = hotelName
        self.imageService = imageService
        self.imageCacheManager = imageCacheManager
    }
    
    func fetchRooms() {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let url = URL(string: requestAPI.getRoomsRequest()) else {return}
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: RoomsResponseData.self, decoder: jsonDecoder)
            .sink { result in
//                switch result {
//                case .failure(let error):
//                default: break
//                }
            } receiveValue: { [weak self] roomsData in
                self?.rooms = roomsData.rooms
            }
            .store(in: &disposables)
    }
}

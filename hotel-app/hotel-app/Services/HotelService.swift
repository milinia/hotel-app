//
//  HotelService.swift
//  hotel-app
//
//  Created by Evelina on 25.12.2023.
//

import Foundation
import Combine

protocol HotelServiceProtocol {
//    func fetchHotel() -> AnyPublisher<HotelData?, Never>
}

final class HotelService: HotelServiceProtocol {
    private var requestManager: RequestAPIManagerProtocol
    private var imageService: ImageServiceProtocol
        
    init(requestManager: RequestAPIManagerProtocol, imageService: ImageServiceProtocol) {
        self.requestManager = requestManager
        self.imageService = imageService
    }
    
//    func fetchHotel() -> AnyPublisher<HotelData?, Never> {
//        guard let url = URL(string: requestManager.getHotelsRequest()) else {return Just(nil).eraseToAnyPublisher()}
//        let jsonDecoder = JSONDecoder()
//        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//        return URLSession.shared.dataTaskPublisher(for: url)
//            .map({$0.data})
//            .decode(type: HotelData.self, decoder: jsonDecoder)
//            .catch({error in Just(error)})
//            .receive(on: RunLoop.main)
//            .eraseToAnyPublisher()
//    }
}

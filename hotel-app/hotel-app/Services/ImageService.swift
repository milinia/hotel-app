//
//  ImageService.swift
//  hotel-app
//
//  Created by Evelina on 28.12.2023.
//

import Combine
import SwiftUI

protocol ImageServiceProtocol {
    func fetchImage(stringURL: String) -> AnyPublisher<Data, Error>
}

final class ImageService: ImageServiceProtocol {
    func fetchImage(stringURL: String) -> AnyPublisher<Data, Error> {
        guard let url = URL(string: stringURL) else {
                return Fail<Data, Error>(error: AppError.invalidURL).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .mapError({$0})
            .eraseToAnyPublisher()
    }
}

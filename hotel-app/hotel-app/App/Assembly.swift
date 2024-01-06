//
//  Assembly.swift
//  hotel-app
//
//  Created by Evelina on 27.12.2023.
//

import Foundation

protocol AssemblyProtocol {
    var networkManager: NetworkManagerProtocol { get }
    var requestsAPIManager: RequestAPIManagerProtocol { get }
    var imageService: ImageServiceProtocol { get }
    var imageCacheManager: ImageCacheManagerProtocol { get }
}


class Assembly: AssemblyProtocol {
    lazy var networkManager: NetworkManagerProtocol = NetworkManager()
    lazy var requestsAPIManager: RequestAPIManagerProtocol = RequestAPIManager()
    lazy var imageService: ImageServiceProtocol = ImageService()
    lazy var imageCacheManager: ImageCacheManagerProtocol = ImageCacheManager()
}

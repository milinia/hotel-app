//
//  ImageCacheManager.swift
//  hotel-app
//
//  Created by Evelina on 02.01.2024.
//

import SwiftUI

protocol ImageCacheManagerProtocol {
    func getImage(forKey key: String) -> Data?
    func setImage(object: Data, forKey key: String)
}

final class ImageCacheManager: ImageCacheManagerProtocol {
    private let cache = NSCache<NSString, NSData>()

    static let shared = ImageCacheManager()
       
    func getImage(forKey key: String) -> Data? {
        let cacheKey = NSString(string: key)
        return cache.object(forKey: cacheKey) as? Data
    }

    func setImage(object: Data, forKey key: String) {
        let cacheKey = NSString(string: key)
        let objectNSData = object as NSData
        cache.setObject(objectNSData, forKey: cacheKey)
    }
}

//
//  HotelData.swift
//  hotel-app
//
//  Created by Evelina on 25.12.2023.
//

import Foundation

struct HotelData: Decodable {
    let id: Int
    let name: String
    let adress: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: AboutTheHotel
}

struct AboutTheHotel: Decodable {
    let description: String
    let peculiarities: [String]
}

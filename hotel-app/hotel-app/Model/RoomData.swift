//
//  RoomData.swift
//  hotel-app
//
//  Created by Evelina on 25.12.2023.
//

import Foundation

struct RoomsResponseData: Hashable, Decodable {
    let rooms: [RoomData]
}

struct RoomData: Identifiable, Hashable, Decodable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]
}

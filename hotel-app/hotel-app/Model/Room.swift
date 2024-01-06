//
//  Room.swift
//  hotel-app
//
//  Created by Evelina on 30.12.2023.
//

import SwiftUI

struct Room: Identifiable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let images: [Image]
}

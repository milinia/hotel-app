//
//  Tag.swift
//  hotel-app
//
//  Created by Evelina on 29.12.2023.
//

import Foundation

struct Tag: Hashable, Identifiable {
    let id = UUID().uuidString
    let title: String
    var size: CGFloat
}

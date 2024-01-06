//
//  PriceFormatter.swift
//  hotel-app
//
//  Created by Evelina on 01.01.2024.
//

import Foundation

protocol PriceFormatterProtocol {
    func formatPrice(price: Int) -> String
}

final class PriceFormatter: PriceFormatterProtocol {
    
    static let shared: PriceFormatterProtocol = PriceFormatter()
    
    func formatPrice(price: Int) -> String {
        var priceNumber = price
        var stringPrice = ""
        var count = 0
        while priceNumber >= 10 {
            count += 1
            stringPrice += String(priceNumber % 10)
            priceNumber = priceNumber / 10
            if (count == 3) {
                stringPrice += " "
                count = 0
            }
        }
        stringPrice += String(priceNumber)
        return (String(stringPrice.reversed()) + " ₽")
    }
}

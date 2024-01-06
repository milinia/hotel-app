//
//  RatingLabel.swift
//  hotel-app
//
//  Created by Evelina on 26.12.2023.
//

import SwiftUI

struct RatingLabel: View {
    private let ratingNumber: String
    private let ratingString: String
    
    init(ratingNumber: String, ratingString: String) {
        self.ratingNumber = ratingNumber
        self.ratingString = ratingString
    }
    
    var body: some View {
        HStack(spacing: 3){
            Asset.starIcon.swiftUIImage
                .resizable()
                .frame(width: 15, height: 15)
            Text(ratingNumber)
                .foregroundColor(Asset.yellowTextColor.swiftUIColor)
                .font(Font.custom("SF Pro Display", size: 16)
                .weight(.medium))
            Text(ratingString)
                .foregroundColor(Asset.yellowTextColor.swiftUIColor)
                .font(Font.custom("SF Pro Display", size: 16)
                .weight(.medium))
        }
        .frame(width: 149, height: 29)
        .background(Asset.yellowBackgroundColor.swiftUIColor)
        .cornerRadius(5)
        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 10))
    }
}

struct RatingLabel_Previews: PreviewProvider {
    static var previews: some View {
        RatingLabel(ratingNumber: "5", ratingString: "Превосходно")
    }
}

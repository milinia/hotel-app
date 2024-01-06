//
//  TextAndIconCell.swift
//  hotel-app
//
//  Created by Evelina on 29.12.2023.
//

import SwiftUI

struct TextAndIconCell: View {
    
    private let image: Image
    private let title: String
    private let desctiption: String
    private let action: () -> Void
    
    init(image: Image, title: String, desctiption: String, action: @escaping () -> Void) {
        self.image = image
        self.title = title
        self.desctiption = desctiption
        self.action = action
    }
    
    var body: some View {
        HStack {
            image
                .resizable()
                .frame(width: 24, height: 24)
            VStack(alignment: .leading) {
                Text(title)
                    .font(Font.custom("SF Pro Display", size: 16)
                    .weight(.medium))
                Text(desctiption)
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Asset.grayTextColor.swiftUIColor)
            }
            Spacer()
            Button {
                action()
            } label: {
                Asset.arrowIcon.swiftUIImage
                    .foregroundColor(Asset.arrowDarkColor.swiftUIColor)
            }
        }
        .frame(width: 343, height: 60)
        .background(Asset.grayCircleColor.swiftUIColor)
    }
}

struct TextAndIconCell_Previews: PreviewProvider {
    static var previews: some View {
        TextAndIconCell(image: Asset.checkmarkIcon.swiftUIImage, title: "Что включено", desctiption: "Самое необходимое", action: {print()})
    }
}

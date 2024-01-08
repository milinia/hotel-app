//
//  AddTouristView.swift
//  hotel-app
//
//  Created by Evelina on 06.01.2024.
//

import SwiftUI

struct AddTouristView: View {
    let action: () -> Void
    
    var body: some View {
        HStack {
            Text(Strings.BookingScreen.addTourist)
                .font(Font.custom("SF Pro Display", size: 22).weight(.bold))
                .foregroundColor(.black)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Button {
                action()
            } label: {
                Asset.plusIcon.swiftUIImage
                    .padding(4)
                    .background(Asset.blueColor.swiftUIColor)
                    .cornerRadius(6)
                    .frame(width: 32, height: 32)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 6)
//                            .foregroundColor(Asset.blueColor.swiftUIColor)
//                            .frame(width: 32, height: 32)
//                    )
                }
            .padding(.trailing, 6)
            Spacer(minLength: 6)
            }
        .padding(.horizontal, 12)
        .padding(.vertical, 12)
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct AddTouristView_Previews: PreviewProvider {
    static var previews: some View {
        AddTouristView(action: {})
    }
}

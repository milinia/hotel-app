//
//  BlueButton.swift
//  hotel-app
//
//  Created by Evelina on 26.12.2023.
//

import SwiftUI

struct BlueButton: View {
    
    let action: () -> Void
    let label: String
    
    init(action: @escaping () -> Void, label: String) {
        self.action = action
        self.label = label
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(label)
            .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
            .kerning(0.1)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(EdgeInsets(top: 15, leading: 0, bottom: 14, trailing: 0))
        }
        .background(Asset.blueColor.swiftUIColor)
        .cornerRadius(15)
        .padding(.horizontal, 16)
    }
}

struct BlueButton_Previews: PreviewProvider {
    static var previews: some View {
        BlueButton(action: {print("Super")}, label: "Супер!")
    }
}

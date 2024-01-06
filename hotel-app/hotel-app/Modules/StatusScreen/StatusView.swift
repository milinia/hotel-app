//
//  StatusView.swift
//  hotel-app
//
//  Created by Evelina on 25.12.2023.
//

import SwiftUI

struct StatusView: View {
    @EnvironmentObject private var coordinator: FlowCoordinator
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                PartyIconView()
                    .padding(.top, 138)
                Spacer(minLength: 32)
                Text(Strings.StatusScreen.statusText)
                    .font(Font.custom("SF Pro Display", size: 22)
                    .weight(.medium))
                    .foregroundColor(.black)
                Spacer(minLength: 20)
                Text(Strings.StatusScreen.DescriptionText.start + "\n" + Strings.StatusScreen.DescriptionText.end)
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(Asset.grayTextColor.swiftUIColor)
                    .frame(maxHeight: .infinity, alignment: .center)
                    .frame(height: 100)
            }
            .padding(.horizontal, 20)
            VStack {
                Divider()
                BlueButton(action: {
                    coordinator.popToRoot()
                }, label: Strings.StatusScreen.buttonText)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(Strings.StatusScreen.title).font(.headline)
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Asset.backArrowIcon.swiftUIImage
                    }
                }
            }
        }
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
    }
}

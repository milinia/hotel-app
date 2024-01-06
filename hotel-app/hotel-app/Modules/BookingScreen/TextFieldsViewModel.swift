//
//  TextFieldsViewModel.swift
//  hotel-app
//
//  Created by Evelina on 05.01.2024.
//

import Combine
import SwiftUI

final class TextFieldsViewModel: ObservableObject {
    @Published var touristInfo = TouristInfo()
    
    func changeColorByText() {
        changeColor(text: touristInfo.nameText, color: &touristInfo.nameTextFieldBackgroundColor)
        changeColor(text: touristInfo.sirnameText, color: &touristInfo.sirnameTextFieldBackgroundColor)
        changeColor(text: touristInfo.birthdayText, color: &touristInfo.birthdayTextFieldBackgroundColor)
        changeColor(text: touristInfo.citizenshipText, color: &touristInfo.citizenshipTextFieldBackgroundColor)
        changeColor(text: touristInfo.passportNumberText, color: &touristInfo.passportNumberTextFieldBackgroundColor)
        changeColor(text: touristInfo.passportValidityPeriodText, color: &touristInfo.passportValidityPeriodTextFieldBackgroundColor)
    }
    
    private func changeColor(text: String, color: inout Color) {
        if (text.isEmpty) {
            color = TextFieldBackgrounsColor.error.color
        } else {
            color = TextFieldBackgrounsColor.regular.color
        }
    }
}

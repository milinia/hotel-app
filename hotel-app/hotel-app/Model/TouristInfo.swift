//
//  TouristInfo.swift
//  hotel-app
//
//  Created by Evelina on 06.01.2024.
//

import SwiftUI

enum TextFieldBackgrounsColor {
    case regular
    case error

    var color: Color {
        switch self {
        case .regular:
            return Asset.grayCircleColor.swiftUIColor
        case .error:
            return Asset.redColor.swiftUIColor
        }
    }
}

struct TouristInfo {
    var nameText = ""
    var sirnameText = ""
    var birthdayText = ""
    var citizenshipText = ""
    var passportNumberText = ""
    var passportValidityPeriodText = ""
    
    var nameTextFieldBackgroundColor = TextFieldBackgrounsColor.regular.color
    var sirnameTextFieldBackgroundColor = TextFieldBackgrounsColor.regular.color
    var birthdayTextFieldBackgroundColor = TextFieldBackgrounsColor.regular.color
    var citizenshipTextFieldBackgroundColor = TextFieldBackgrounsColor.regular.color
    var passportNumberTextFieldBackgroundColor = TextFieldBackgrounsColor.regular.color
    var passportValidityPeriodTextFieldBackgroundColor = TextFieldBackgrounsColor.regular.color
    
    var isValid: Bool {
        !nameText.isEmpty &&
        !sirnameText.isEmpty &&
        !birthdayText.isEmpty &&
        !citizenshipText.isEmpty &&
        !passportNumberText.isEmpty &&
        !passportValidityPeriodText.isEmpty
    }
}

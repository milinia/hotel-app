//
//  CustomerInfo.swift
//  hotel-app
//
//  Created by Evelina on 06.01.2024.
//

import Foundation

struct CustomerInfo {
    var emailText = ""
    var emailTextFieldBackgroundColor = TextFieldBackgrounsColor.regular.color
    
    var phoneText = ""
    var phoneTextFieldBackgroundColor = TextFieldBackgrounsColor.regular.color
    
    var isValid: Bool {
        !emailText.isEmpty &&
        !phoneText.isEmpty
    }
}

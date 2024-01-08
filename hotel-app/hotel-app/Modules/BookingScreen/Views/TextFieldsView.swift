//
//  TextFieldsView.swift
//  hotel-app
//
//  Created by Evelina on 01.01.2024.
//

import SwiftUI

struct TextFieldsView: View {
    private let dateMask = "XX.XX.XXXX"
    @ObservedObject var viewModel: TextFieldsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            let birthdayTextChangedBinding = Binding<String>(
                get: {
                    NumberFilter.format(with: self.dateMask, text: self.viewModel.touristInfo.birthdayText)},
                            
                set: { self.viewModel.touristInfo.birthdayText = $0
            })
            let passportValidityPeriodTextChangedBinding = Binding<String>(
                get: {
                    NumberFilter.format(with: self.dateMask, text: self.viewModel.touristInfo.passportValidityPeriodText)},
                            
                set: { self.viewModel.touristInfo.passportValidityPeriodText = $0
            })
            TextFieldWithUpPlaceholder(title: Strings.BookingScreen.AboutCustomer.name, inputType: .asciiCapable, text: $viewModel.touristInfo.nameText, backgroundColor: $viewModel.touristInfo.nameTextFieldBackgroundColor)

            TextFieldWithUpPlaceholder(title: Strings.BookingScreen.AboutCustomer.surname, inputType: .asciiCapable, text: $viewModel.touristInfo.sirnameText, backgroundColor: $viewModel.touristInfo.sirnameTextFieldBackgroundColor)

            TextFieldWithUpPlaceholder(title: Strings.BookingScreen.AboutCustomer.birthday, inputType: .asciiCapable, text: birthdayTextChangedBinding, backgroundColor: $viewModel.touristInfo.birthdayTextFieldBackgroundColor)

            TextFieldWithUpPlaceholder(title: Strings.BookingScreen.AboutCustomer.citizenship, inputType: .asciiCapable, text: $viewModel.touristInfo.citizenshipText, backgroundColor: $viewModel.touristInfo.citizenshipTextFieldBackgroundColor)

            TextFieldWithUpPlaceholder(title: Strings.BookingScreen.AboutCustomer.passportNumber, inputType: .asciiCapable, text: $viewModel.touristInfo.passportNumberText, backgroundColor: $viewModel.touristInfo.passportNumberTextFieldBackgroundColor)

            TextFieldWithUpPlaceholder(title: Strings.BookingScreen.AboutCustomer.passportValidityPeriod, inputType: .asciiCapable, text: passportValidityPeriodTextChangedBinding, backgroundColor: $viewModel.touristInfo.passportValidityPeriodTextFieldBackgroundColor)
        }
    }
}

//struct TextFieldsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldsView()
//    }
//}

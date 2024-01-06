//
//  AboutCustomerView.swift
//  hotel-app
//
//  Created by Evelina on 06.01.2024.
//

import SwiftUI

final class AboutCustomerViewModel: ObservableObject {
    @Published var customerInfo = CustomerInfo()
    
    func changeColorByText() {
        changeColor(text: customerInfo.emailText, color: &customerInfo.emailTextFieldBackgroundColor)
        changeColor(text: customerInfo.phoneText, color: &customerInfo.phoneTextFieldBackgroundColor)
    }
    
    private func changeColor(text: String, color: inout Color) {
        if (text.isEmpty) {
            color = TextFieldBackgrounsColor.error.color
        } else {
            color = TextFieldBackgrounsColor.regular.color
        }
    }
}

struct AboutCustomerView: View {
    @ObservedObject var viewModel: AboutCustomerViewModel
    private let phoneMask = "+X (XXX) XXX-XX-XX"

    var body: some View {
        VStack(alignment: .leading) {
            let textChangedBinding = Binding<String>(
                get: { NumberFilter.format(with: self.phoneMask, text: self.viewModel.customerInfo.phoneText)},
                set: { self.viewModel.customerInfo.phoneText = $0})
            Text(Strings.BookingScreen.AboutCustomer.title)
                .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding(.leading, 16)
            Spacer(minLength: 16)
            TextFieldWithUpPlaceholder(title: Strings.BookingScreen.AboutCustomer.phone, inputType: .phonePad, text: textChangedBinding, backgroundColor: $viewModel.customerInfo.phoneTextFieldBackgroundColor)
            Spacer(minLength: 12)
            TextFieldWithUpPlaceholder(title: Strings.BookingScreen.AboutCustomer.email, inputType: .emailAddress, text: $viewModel.customerInfo.emailText, backgroundColor: $viewModel.customerInfo.emailTextFieldBackgroundColor)
            Spacer(minLength: 5)
            Text(Strings.BookingScreen.AboutCustomer.info)
                .font(Font.custom("SF Pro Display", size: 14))
                .foregroundColor(Asset.grayTextColor.swiftUIColor)
                .padding(.bottom, 8)
                .padding(.leading, 16)
        }
    }
}

//struct AboutCustomerView_Previews: PreviewProvider {
//    static var previews: some View {
//        AboutCustomerView()
//    }
//}

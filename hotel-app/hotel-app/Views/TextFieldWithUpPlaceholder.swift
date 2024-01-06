//
//  TextFieldWithUpPlaceholder.swift
//  hotel-app
//
//  Created by Evelina on 31.12.2023.
//

import SwiftUI

struct TextFieldWithUpPlaceholder: View {
    private var title: String
    private let inputType: UIKeyboardType
    @Binding var text: String
    @State private var isEditing = false
    @Binding var backgroundColor: Color
    
    init(title: String, inputType: UIKeyboardType, text: Binding<String>, backgroundColor: Binding<Color>) {
        self.title = title
        self.inputType = inputType
        self._text = text
        self._backgroundColor = backgroundColor
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextField(isEditing ? "" : title, text: $text, onEditingChanged: { editing in
                    withAnimation {
                        isEditing = editing
                    }
            })
            .keyboardType(inputType)
            .frame(height: 52)
            .padding(.horizontal)
            .padding(.top, 5)
            .background(backgroundColor)
            .cornerRadius(10)
            HStack {
                Text((isEditing || !text.isEmpty) ? title : "")
                    .font(Font.custom("SF Pro Display", size: 12))
                    .kerning(0.12)
                    .foregroundColor(Asset.grayTextColor.swiftUIColor)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 0))
            }
        }
        .padding(16)
        .frame(height: 52)
    }
}

//struct TextFieldWithUpPlaceholder_Previews: PreviewProvider {
//
//    static var previews: some View {
//        TextFieldWithUpPlaceholder(title: "Гражданство", inputType: .asciiCapable, whereToWrite: "")
//    }
//}
//
//struct TextFieldWithUpPlaceholder2_Previews: PreviewProvider {
//
//    static var previews: some View {
//        TextFieldWithUpPlaceholder(title: "Номер телефона", inputType: .phonePad, whereToWrite: "")
//    }
//}

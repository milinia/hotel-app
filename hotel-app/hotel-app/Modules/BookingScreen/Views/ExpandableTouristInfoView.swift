//
//  ExpandableTouristInfoView.swift
//  hotel-app
//
//  Created by Evelina on 31.12.2023.
//

import Combine
import SwiftUI

final class ExpandableTouristInfoViewModel: ObservableObject {
    @Published var isExpanded: Bool = true
    @Published var textFieldsViewModel: TextFieldsViewModel = TextFieldsViewModel()
}

struct ExpandableTouristInfoView: View, Identifiable {
    let id = UUID()
    let touristNumber: String
    @StateObject var expandableViewModel: ExpandableTouristInfoViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text(touristNumber)
                    .font(Font.custom("SF Pro Display", size: 22).weight(.bold))
                    .foregroundColor(.black)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Button {
                    expandableViewModel.isExpanded.toggle()
                } label: {
                    if expandableViewModel.isExpanded {
                        Asset.arrowUpIcon.swiftUIImage
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .foregroundColor(Asset.blueColor.swiftUIColor.opacity(0.1))
                                    .frame(width: 32, height: 32)
                            )
                    } else {
                        Asset.arrowDownIcon.swiftUIImage
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .foregroundColor(Asset.blueColor.swiftUIColor.opacity(0.1))
                                    .frame(width: 32, height: 32)
                            )
                    }
                }
            }
            .padding(.horizontal, 16)
//            .padding(.vertical, 8)
            .frame(minWidth: 0, maxWidth: .infinity)
            if (expandableViewModel.isExpanded) {
                TextFieldsView(viewModel: expandableViewModel.textFieldsViewModel)
            }
        }
        .padding(.vertical, 8)
    }
}

struct ExpandableTouristInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableTouristInfoView(touristNumber: "Первый турист", expandableViewModel: ExpandableTouristInfoViewModel())
    }
}

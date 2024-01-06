//
//  TwoColumnView.swift
//  hotel-app
//
//  Created by Evelina on 03.01.2024.
//

import SwiftUI

struct TwoColumnView: View {
    
    let data: [String]
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    init(data: [String]) {
        self.data = data
    }
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading) {
            ForEach(Array(data.enumerated()), id: \.1) { (index, text) in
                if (index % 2 == 0) {
                    Text(text)
                        .foregroundColor(Asset.grayTextColor.swiftUIColor)
                } else {
                    Text(text)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

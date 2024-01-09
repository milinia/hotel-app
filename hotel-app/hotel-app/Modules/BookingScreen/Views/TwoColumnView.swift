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
            ForEach(data.indices, id: \.self) { index in
                Text(data[index])
                    .foregroundColor(index % 2 == 0 ? Asset.grayTextColor.swiftUIColor : Color.black)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

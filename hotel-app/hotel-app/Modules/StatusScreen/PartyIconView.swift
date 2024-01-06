//
//  PartyIconView.swift
//  hotel-app
//
//  Created by Evelina on 26.12.2023.
//

import SwiftUI

struct PartyIconView: View {
    
    private enum UIConstants {
        static let circleWidthHeight: CGFloat = 94
        static let partyIconWidthHeight: CGFloat = 44
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Asset.grayCircleColor.swiftUIColor)
                .frame(width: UIConstants.circleWidthHeight, height: UIConstants.circleWidthHeight)
            Asset.partyIcon.swiftUIImage
                .resizable()
                .frame(width: UIConstants.partyIconWidthHeight, height: UIConstants.partyIconWidthHeight)
        }
    }
}

struct PartyIconView_Previews: PreviewProvider {
    static var previews: some View {
        PartyIconView()
    }
}

//
//  ViewExtension.swift
//  hotel-app
//
//  Created by Evelina on 31.12.2023.
//

import SwiftUI

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}

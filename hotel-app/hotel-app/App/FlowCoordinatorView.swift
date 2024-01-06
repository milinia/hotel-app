//
//  FlowCoordinatorView.swift
//  hotel-app
//
//  Created by Evelina on 02.01.2024.
//

import Foundation
import SwiftUI

struct FlowCoordinatorView: View {
    @StateObject private var coordinator: FlowCoordinator = FlowCoordinator(assembly: Assembly())
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(link: .hotelLink)
                .navigationDestination(for: ContentLink.self) { link in
                    coordinator.build(link: link)
                }
        }
        .environmentObject(self.coordinator)
    }
}

struct FlowCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        FlowCoordinatorView()
    }
}

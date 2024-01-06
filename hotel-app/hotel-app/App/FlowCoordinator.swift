//
//  FlowCoordinator.swift
//  hotel-app
//
//  Created by Evelina on 27.12.2023.
//

import SwiftUI

enum ContentLink: Identifiable, Hashable {
    case hotelLink
    case roomsLink(hotelName: String)
    case bookingLink
    case resultLink
    
    var id: String {
        switch self {
            case .hotelLink:
                return "hotelLink"
            case .roomsLink(let hotelName):
                return "roomsLink_\(hotelName)"
            case .bookingLink:
                return "bookingLink"
            case .resultLink:
                return "resultLink"
        }
    }
    
    func hash(into hasher: inout Hasher) {
            switch self {
            case .hotelLink:
                hasher.combine("hotelLink")
            case .roomsLink(let hotelName):
                hasher.combine("roomsLink")
                hasher.combine(hotelName)
            case .bookingLink:
                hasher.combine("bookingLink")
            case .resultLink:
                hasher.combine("resultLink")
            }
        }

        static func == (lhs: ContentLink, rhs: ContentLink) -> Bool {
            switch (lhs, rhs) {
            case (.hotelLink, .hotelLink):
                return true
            case let (.roomsLink(hotelName1), .roomsLink(hotelName2)):
                return hotelName1 == hotelName2
            case (.bookingLink, .bookingLink):
                return true
            case (.resultLink, .resultLink):
                return true
            default:
                return false
            }
        }
}

class FlowCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    private let assembly: AssemblyProtocol
    
    init(assembly: AssemblyProtocol) {
        self.assembly = assembly
    }
    
    func push(link: ContentLink) {
        path.append(link)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func pop() {
        path.removeLast()
    }
    
    @ViewBuilder
    func build(link: ContentLink) -> some View {
        switch link {
        case .hotelLink:
            HotelView(viewModel: HotelViewModel(requestAPI: self.assembly.requestsAPIManager, imageService: self.assembly.imageService, imageCacheManager: self.assembly.imageCacheManager))
                
        case .roomsLink(let hotelName):
            RoomView(viewModel: RoomViewModel(requestAPI: self.assembly.requestsAPIManager, hotelName: hotelName, imageService: self.assembly.imageService, imageCacheManager: self.assembly.imageCacheManager))
                
        case .bookingLink:
            BookingView(viewModel: BookingViewModel(requestAPI: self.assembly.requestsAPIManager))
               
        case .resultLink:
            StatusView()
        }
    }
}

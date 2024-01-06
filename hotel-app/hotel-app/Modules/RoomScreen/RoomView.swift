//
//  RoomView.swift
//  hotel-app
//
//  Created by Evelina on 25.12.2023.
//

import SwiftUI

struct RoomView: View {
    @StateObject var viewModel: RoomViewModel
    @EnvironmentObject private var coordinator: FlowCoordinator
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List {
            ForEach(viewModel.rooms, id: \.self) { room in
                RoomCell(viewModel: RoomCellViewModel(imageURLs: room.imageUrls, imageService: viewModel.imageService, imageCacheManager: viewModel.imageCacheManager), room: room, action: {coordinator.push(link: .bookingLink)})
                    .cornerRadius(12)
            }
        }
        .listStyle(.inset)
        .background(.clear)
        .onAppear(perform: viewModel.fetchRooms)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(viewModel.hotelName).font(.headline)
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Asset.backArrowIcon.swiftUIImage
                    }
                }
            }
        }
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView(viewModel: RoomViewModel(requestAPI: RequestAPIManager(), hotelName: "", imageService: ImageService(), imageCacheManager: ImageCacheManager()))
    }
}

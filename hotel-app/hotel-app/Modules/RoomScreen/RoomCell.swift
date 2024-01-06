//
//  RoomCell.swift
//  hotel-app
//
//  Created by Evelina on 30.12.2023.
//

import SwiftUI

struct RoomCell: View {
    
    @StateObject var viewModel: RoomCellViewModel
    let room: RoomData
    let action: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            ImageCarouselView(images: viewModel.images)
            Text(room.name)
                .font(Font.custom("SF Pro Display", size: 22)
                    .weight(.medium))
                .foregroundColor(.black)
                .frame(width: 343, alignment: .topLeading)
            HorizontalCollectionView(elements: room.peculiarities)
            HStack(spacing: 10){
                Text(Strings.RoomScreen.aboutRoom)
                    .foregroundColor(Asset.blueColor.swiftUIColor)
                    .font(Font.custom("SF Pro Display", size: 16)
                    .weight(.medium))
                Asset.arrowIcon.swiftUIImage
                    .resizable()
                    .frame(width: 6, height: 12)
                    .foregroundColor(Asset.blueColor.swiftUIColor)
            }
            .frame(width: 192, height: 29)
            .background(Asset.blueColor.swiftUIColor.opacity(0.1))
            .cornerRadius(5)
            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 10))
            HStack(alignment: .bottom) {
                Text(PriceFormatter.shared.formatPrice(price: room.price))
                    .font(Font.custom("SF Pro Display", size: 30)
                        .weight(.heavy))
                    .foregroundColor(.black)
                Text(room.pricePer)
                  .font(Font.custom("SF Pro Display", size: 16))
                  .foregroundColor(Asset.grayTextColor.swiftUIColor)
            }
            BlueButton(action: action, label: Strings.RoomScreen.chooseRoom)
        }
    }
}

//struct RoomCell_Previews: PreviewProvider {
//    static var previews: some View {
//        RoomCell(viewModel: RoomCellViewModel(imageURLs: <#T##[String]#>, imageService: <#T##ImageServiceProtocol#>, imageCacheManager: <#T##ImageCacheManagerProtocol#>), room: RoomData(id: 1, name: "Стандартный с видом на бассейн или сад", price: 186600, pricePer: "за 7 ночей с перелётом", peculiarities: ["Все включено", "Кондиционер"], imageUrls: []), action: {})
//    }
//}

//
//  HotelView.swift
//  hotel-app
//
//  Created by Evelina on 25.12.2023.
//

import SwiftUI

struct HotelView: View {
    @StateObject var viewModel: HotelViewModel
    @EnvironmentObject private var coordinator: FlowCoordinator
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                ImageCarouselView(images: viewModel.images)
                    .frame(height: 257)
                RatingLabel(ratingNumber:  String(viewModel.hotel?.rating ?? 0), ratingString: viewModel.hotel?.ratingName ?? "")
                Text(viewModel.hotel?.name ?? "")
                    .font(Font.custom("SF Pro Display", size: 22)
                    .weight(.medium))
                    .foregroundColor(.black)
                    .frame(width: 343, alignment: .leading)
                Spacer(minLength: 8)
                Text(viewModel.hotel?.adress ?? "")
                    .font(Font.custom("SF Pro Display", size: 14)
                    .weight(.medium))
                    .foregroundColor(Asset.blueColor.swiftUIColor)
                    .frame(width: 343, alignment: .topLeading)
                Spacer(minLength: 16)
                HStack {
                    Text("от " + PriceFormatter.shared.formatPrice(price: viewModel.hotel?.minimalPrice ?? 0))
                        .font(Font.custom("SF Pro Display", size: 30)
                        .weight(.semibold))
                        .foregroundColor(.black)
                    Text(viewModel.hotel?.priceForIt ?? "")
                      .font(Font.custom("SF Pro Display", size: 16))
                      .foregroundColor(Asset.grayTextColor.swiftUIColor)
                }
                Spacer(minLength: 8)
            }
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(15)
            .frame(maxWidth: .infinity)
            Spacer(minLength: 8)
            VStack {
                Text(Strings.HotelScreen.about)
                    .font(Font.custom("SF Pro Display", size: 22).weight(.medium))
                    .foregroundColor(.black)
                    .frame(width: 343, alignment: .topLeading)
                    .padding(.top, 16)
                HorizontalCollectionView(elements: viewModel.hotel?.aboutTheHotel.peculiarities ?? [])
                Spacer(minLength: 17)
                Text(viewModel.hotel?.aboutTheHotel.description ?? "")
                    .font(Font.custom("SF Pro Display", size: 16))
                    .foregroundColor(.black.opacity(0.9))
                    .frame(width: 343, alignment: .topLeading)
                Spacer(minLength: 16)
                VStack {
                    TextAndIconCell(image: Asset.happyIcon.swiftUIImage, title: "Удобства", desctiption: "Самое необходимое", action: {})
                    Divider()
                    TextAndIconCell(image: Asset.checkmarkIcon.swiftUIImage, title: "Что включено", desctiption: "Самое необходимое", action: {})
                    Divider()
                    TextAndIconCell(image: Asset.happyIcon.swiftUIImage, title: "Что не включено", desctiption: "Самое необходимое", action: {})
                }
                .background(Asset.grayCircleColor.swiftUIColor)
                .cornerRadius(15)
                .padding(.horizontal, 16)
                Spacer(minLength: 16)
            }
            .background(Color.white)
            .cornerRadius(15)
            .frame(maxWidth: .infinity)
            Spacer(minLength: 12)
            VStack {
                Divider()
                BlueButton(action: {coordinator.push(link: .roomsLink(hotelName: viewModel.hotel?.name ?? ""))}, label: Strings.HotelScreen.toRooms)
                    .frame(width: 343, height: 48, alignment: .center)
            }
            .background(Color.white)
            .frame(maxWidth: .infinity)
        }
        .background(Asset.grayCircleColor.swiftUIColor)
//        .padding(16)
        .onAppear(perform: viewModel.fetchHotel)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(Strings.HotelScreen.title).font(.headline)
                }
            }
        }
    }
}

struct HotelView_Previews: PreviewProvider {
    static var previews: some View {
        HotelView(viewModel: HotelViewModel(requestAPI: RequestAPIManager(), imageService: ImageService(), imageCacheManager: ImageCacheManager()))
    }
}

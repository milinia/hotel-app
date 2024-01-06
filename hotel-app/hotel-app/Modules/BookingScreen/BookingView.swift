//
//  BookingView.swift
//  hotel-app
//
//  Created by Evelina on 31.12.2023.
//

import SwiftUI

struct BookingView: View {
    @StateObject var viewModel: BookingViewModel
    @EnvironmentObject private var coordinator: FlowCoordinator
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        let finalPrice = (viewModel.bookingdata?.fuelCharge ?? 0) + (viewModel.bookingdata?.serviceCharge ?? 0) + (viewModel.bookingdata?.tourPrice ?? 0)
        ScrollView {
            VStack(alignment: .leading) {
                RatingLabel(ratingNumber: String(viewModel.bookingdata?.horating ?? 0), ratingString: viewModel.bookingdata?.ratingName ?? "")
//                    .frame(maxWidth: .infinity)
                Text(viewModel.bookingdata?.hotelName ?? "")
                    .font(Font.custom("SF Pro Display", size: 22)
                    .weight(.medium))
                    .foregroundColor(.black)
                Spacer(minLength: 8)
                Text(viewModel.bookingdata?.hotelAdress ?? "")
                    .font(Font.custom("SF Pro Display", size: 14)
                    .weight(.medium))
                    .foregroundColor(Asset.blueColor.swiftUIColor)
            }
            .padding(16)
            .cornerRadius(15)
            .background(Color.white)
            Spacer(minLength: 8)
            let data = [Strings.BookingScreen.from, viewModel.bookingdata?.departure ?? "", Strings.BookingScreen.to, viewModel.bookingdata?.arrivalCountry ?? "", Strings.BookingScreen.dates, uniteTwoDates(s1: viewModel.bookingdata?.tourDateStart, s2: viewModel.bookingdata?.tourDateStop),
                        Strings.BookingScreen.nightsCount, String(viewModel.bookingdata?.numberOfNights ?? 0), Strings.BookingScreen.hotel, viewModel.bookingdata?.hotelName ?? "", Strings.BookingScreen.room, viewModel.bookingdata?.room ?? "", Strings.BookingScreen.food, viewModel.bookingdata?.nutrition ?? ""]
            TwoColumnView(data: data)
                .padding(16)
                .cornerRadius(15)
                .background(Color.white)
            Spacer(minLength: 8)
            viewModel.aboutCustomerView
            .padding(.top, 8)
//            .padding(.leading, 6)
            .cornerRadius(15)
            .background(Color.white)
//            .frame(maxWidth: .infinity)
            ForEach(viewModel.expandableTextFields) { view in
                VStack {
                    view
                }
                .background(Color.white)
                .cornerRadius(15)
                .frame(maxWidth: .infinity)
            }
            AddTouristView {
                viewModel.addTourist()
            }
            .background(Color.white)
            .cornerRadius(15)
            .frame(maxWidth: .infinity)
            Spacer(minLength: 8)
            let data2 = [Strings.BookingScreen.tour, PriceFormatter.shared.formatPrice(price: viewModel.bookingdata?.tourPrice ?? 0), Strings.BookingScreen.fuelSurcharge, PriceFormatter.shared.formatPrice(price: viewModel.bookingdata?.fuelCharge ?? 0), Strings.BookingScreen.serviceSurcharge, PriceFormatter.shared.formatPrice(price: viewModel.bookingdata?.serviceCharge ?? 0), Strings.BookingScreen.toPay, PriceFormatter.shared.formatPrice(price: finalPrice)]
            
            TwoColumnView(data: data2)
                .frame(maxWidth: .infinity)
                .cornerRadius(15)
                .padding(16)
                .background(Color.white)
            VStack {
                Divider()
                BlueButton(action: {
                    if (viewModel.checkIfTextFieldsFilled()) {
                        coordinator.push(link: .resultLink)
                    }
                }, label: (Strings.BookingScreen.pay + " " + PriceFormatter.shared.formatPrice(price: finalPrice)))
                .frame(width: 343, height: 48, alignment: .center)
            }
            .background(Color.white)
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .background(Asset.grayCircleColor.swiftUIColor)
        .onAppear(perform: viewModel.fetchBookingData)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(Strings.BookingScreen.title).font(.headline)
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
    
    private func uniteTwoDates(s1: String?, s2: String?) -> String {
        var resultString = ""
        resultString += s1 ?? ""
        resultString += " - "
        resultString += s2 ?? ""
        return resultString
    }
}

//struct BookingView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookingView(viewModel: BookingViewModel(requestAPI: RequestAPIManager()))
//    }
//}

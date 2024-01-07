//
//  BookingViewModel.swift
//  hotel-app
//
//  Created by Evelina on 25.12.2023.
//

import Combine
import SwiftUI

enum TouristNumber: String {
    case first = "Первый турист"
    case second = "Второй турист"
    case third = "Третий турист"
    case fourth = "Четвертый турист"
    case fifth = "Пятый турист"
    case sixth = "Шестой турист"
    case seventh = "Седьмой турист"
    case eighth = "Восьмой турист"
    case nineth = "Девятый турист"
    case tenth = "Десятый турист"
    
    var plusOne: TouristNumber {
        switch self {
        case .first:
            return TouristNumber.second
        case .second:
            return TouristNumber.third
        case .third:
            return TouristNumber.fourth
        case .fourth:
            return TouristNumber.fifth
        case .fifth:
            return TouristNumber.sixth
        case .sixth:
            return TouristNumber.seventh
        case .seventh:
            return TouristNumber.eighth
        case .eighth:
            return TouristNumber.nineth
        case .nineth:
            return TouristNumber.tenth
        case .tenth:
            return TouristNumber.tenth
        }
    }
}

protocol BookingViewModelProtocol {
    func fetchBookingData()
}

final class BookingViewModel: ObservableObject, BookingViewModelProtocol {
    @Published var bookingdata: BookingData?
    private let requestAPI: RequestAPIManagerProtocol
    private var disposables = Set<AnyCancellable>()
    @Published var touristsNumber = TouristNumber.first
    @Published var expandableViewModels = [ExpandableTouristInfoViewModel()]
    @Published var expandableTextFields: [ExpandableTouristInfoView] = []
    @Published var aboutCustomerView: AboutCustomerView = AboutCustomerView(viewModel: AboutCustomerViewModel())
    
    init(requestAPI: RequestAPIManagerProtocol) {
        self.requestAPI = requestAPI
        self.expandableViewModels = [ExpandableTouristInfoViewModel()]
        self.expandableTextFields = [ExpandableTouristInfoView(touristNumber: touristsNumber.rawValue, expandableViewModel: self.expandableViewModels[0])]
        self.aboutCustomerView = AboutCustomerView(viewModel: AboutCustomerViewModel())
    }
    
    func addTourist() {
        let expandableViewModel = ExpandableTouristInfoViewModel()
        expandableViewModels.append(expandableViewModel)
        touristsNumber = touristsNumber.plusOne
        expandableTextFields.append(ExpandableTouristInfoView(touristNumber: touristsNumber.rawValue, expandableViewModel: expandableViewModel))
    }
    
    func checkIfTextFieldsFilled() -> Bool {
        var isTextFieldsFilled: Bool = true
        expandableViewModels.forEach { model in
            if (!model.textFieldsViewModel.touristInfo.isValid) {
                isTextFieldsFilled = false
                model.textFieldsViewModel.changeColorByText()
            }
        }
        
        if (!aboutCustomerView.viewModel.customerInfo.isValid) {
            isTextFieldsFilled = false
            aboutCustomerView.viewModel.changeColorByText()
        }
        return isTextFieldsFilled
    }
    
    func fetchBookingData() {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let url = URL(string: requestAPI.getBookingRequest()) else {return}
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: BookingData.self, decoder: jsonDecoder)
            .sink { result in
//                switch result {
//                case .failure(let error):
//                }
            } receiveValue: { [weak self] data in
                self?.bookingdata = data
            }
            .store(in: &disposables)
    }
}

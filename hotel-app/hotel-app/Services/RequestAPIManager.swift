//
//  RequestAPIManager.swift
//  hotel-app
//
//  Created by Evelina on 25.12.2023.
//

import Foundation

protocol RequestAPIManagerProtocol {
    func getHotelsRequest() -> String
    func getRoomsRequest() -> String
    func getBookingRequest() -> String
}

class RequestAPIManager: RequestAPIManagerProtocol {
    func getHotelsRequest() -> String {
        return "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473"
    }
    
    func getRoomsRequest() -> String {
        return "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195"
    }
    
    func getBookingRequest() -> String {
        return "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff"
    }
}

//
//  APIClientHelper.swift
//  Alamofire-Integration
//
//  Created by Ahmed Sadiq on 25/03/2024.
//

import Foundation

class APIClientHelper {
    static var customDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }
}
